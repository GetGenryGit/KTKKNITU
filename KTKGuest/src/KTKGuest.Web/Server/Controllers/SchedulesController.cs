using System.Data;
using System.Text.Json;
using KTKGuest.WebComponents.Data;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace KTKGuest.Web.Server.Controllers;

[Route("api/[controller]")]
[ApiController]
public class SchedulesController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private string _connectionString;
    
    public SchedulesController(IConfiguration configuration)
    {
        _configuration = configuration;
        _connectionString = _configuration.GetConnectionString("PostgreConnectionString");
    }

    [HttpGet]
    [Route("[action]")]
    public IActionResult Get(DateTime date, string filter, string? value)
    {
        var response = new APIResponse();
        var scheduleGet = new ScheduleGet();
        
        var dtSchedule = new DataTable();
        var dtTime = new DataTable();

        try
        {
            /*
                filter:
                0 - full schedule
                1 - teacher
                2 - collective
                3 - classroom
            */

            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query;

                query = "SELECT " +
                        "start_at, end_at " +
                        "FROM schedules_times " +
                        "WHERE schedule_id = (SELECT id FROM schedules WHERE study_date = @date); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@date", date);
                    
                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dtTime.Load(dataReader);
                }

                foreach (DataRow row in dtTime.Rows)
                {
                    scheduleGet.StartAt.Add((TimeSpan)row["start_at"]);
                    scheduleGet.EndAt.Add((TimeSpan)row["end_at"]);
                }

                switch (filter)
                {
                    case "0":
                        query = "SELECT " +
                                "class_index, " +
                                "(SELECT title FROM teachers WHERE id = teacher_id) AS teacher, " +
                                "(SELECT title FROM subjects WHERE id = subject_id) AS subject, " +
                                "(SELECT title FROM collectives WHERE id = collective_id) AS collective, " +
                                "(SELECT title FROM classrooms WHERE id = classroom_id) AS classroom, " +
                                "sub_group " +
                                "FROM schedules_details " +
                                "WHERE schedule_id = (SELECT id FROM schedules WHERE study_date = @date)";
                    break;
                    case "1":
                        query = "SELECT " +
                                "class_index, " +
                                "(SELECT title FROM teachers WHERE id = teacher_id) AS teacher, " +
                                "(SELECT title FROM subjects WHERE id = subject_id) AS subject, " +
                                "(SELECT title FROM collectives WHERE id = collective_id) AS collective, " +
                                "(SELECT title FROM classrooms WHERE id = classroom_id) AS classroom, " +
                                "sub_group " +
                                "FROM schedules_details " +
                                "WHERE schedule_id = (SELECT id FROM schedules WHERE study_date = @date) AND teacher_id = (SELECT id FROM teachers where title = @value);";
                    break;
                    case "2":
                        query = "SELECT " +
                                "class_index, " +
                                "(SELECT title FROM teachers WHERE id = teacher_id) AS teacher, " +
                                "(SELECT title FROM subjects WHERE id = subject_id) AS subject, " +
                                "(SELECT title FROM collectives WHERE id = collective_id) AS collective, " +
                                "(SELECT title FROM classrooms WHERE id = classroom_id) AS classroom, " +
                                "sub_group " +
                                "FROM schedules_details " +
                                "WHERE schedule_id = (SELECT id FROM schedules WHERE study_date = @date) AND collective_id = (SELECT id FROM collectives where title = @value);";
                    break;
                    case "3":
                        query = "SELECT " +
                                "class_index, " +
                                "(SELECT title FROM teachers WHERE id = teacher_id) AS teacher, " +
                                "(SELECT title FROM subjects WHERE id = subject_id) AS subject, " +
                                "(SELECT title FROM collectives WHERE id = collective_id) AS collective, " +
                                "(SELECT title FROM classrooms WHERE id = classroom_id) AS classroom, " +
                                "sub_group " +
                                "FROM schedules_details " +
                                "WHERE schedule_id = (SELECT id FROM schedules WHERE study_date = @date) AND classroom_id = (SELECT id FROM classrooms where title = @value);";
                    break;
                    default:
                        response.Result = false;
                        response.Message = "Некорректный параметр filter";

                        return BadRequest(response);
                }
                
                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@date", date);
                    
                    if (!string.IsNullOrWhiteSpace(value))
                        cmd.Parameters.AddWithValue("@value", value);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dtSchedule.Load(dataReader);
                }

                foreach (DataRow row in dtSchedule.Rows) 
                {
                    scheduleGet.ScheduleListData.Add(new ScheduleItem
                    {
                        ClassIndex = (int)row["class_index"],
                        Teacher = (string)row["teacher"],
                        Subject = (string)row["subject"],
                        Collective = (string)row["collective"],
                        Classroom = (string)row["classroom"],
                        SubGroup = (int)row["sub_group"]
                    });
                }
            }

            response.Result = true;
            response.Message = $"Расписание за {date.ToString("dd-MM-yyyy")} успешно получено!";

            response.obj = scheduleGet;
            
            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при получение расписания!";
#endif
            return BadRequest(response);
        }
    }

    [HttpPost]
    [Route("[action]")]
    public IActionResult Add([FromForm] DateTime date, [FromForm] string data)
    {
        var response = new APIResponse();

        ScheduleGet _data = new ScheduleGet();

        try
        {
            _data = JsonSerializer.Deserialize<ScheduleGet>(data);

            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query;

                query = "INSERT INTO schedules(study_date) " +
                        "VALUES(@date); ";
                
                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@date", date);

                    cmd.ExecuteNonQuery();
                }

                query = "INSERT INTO schedules_details" +
                        "(schedule_id, class_index, teacher_id, " +
                        "subject_id, collective_id, classroom_id, sub_group) " +
                        "VALUES" +
                        "( " +
                        "   (SELECT id FROM schedules WHERE study_date = @date), " +
                        "   @class_index, " +
                        "   (SELECT id FROM teachers WHERE title = @teacher), " +
                        "   (SELECT id FROM subjects WHERE title = @subject), " +
                        "   (SELECT id FROM collectives WHERE title = @collective), " +
                        "   (SELECT id FROM classrooms WHERE title = @classroom), " +
                        "   @sub_group " +
                        "); ";

                for (int i = 0; i < _data.ScheduleListData.Count; i++)
                {
                    using (var cmd = new NpgsqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@date", date);
                        cmd.Parameters.AddWithValue("@class_index", _data.ScheduleListData[i].ClassIndex);
                        cmd.Parameters.AddWithValue("@teacher", _data.ScheduleListData[i].Teacher);
                        cmd.Parameters.AddWithValue("@subject", _data.ScheduleListData[i].Subject);
                        cmd.Parameters.AddWithValue("@collective", _data.ScheduleListData[i].Collective);
                        cmd.Parameters.AddWithValue("@classroom", _data.ScheduleListData[i].Classroom);
                        cmd.Parameters.AddWithValue("@sub_group", _data.ScheduleListData[i].SubGroup);

                        cmd.ExecuteNonQuery();
                    }
                }

                query = "INSERT INTO schedules_times(schedule_id, start_at, end_at) " +
                        "VALUES " +
                        "( " +
                        "   (SELECT id FROM schedules WHERE study_date = @date)," +
                        "   @start_at," +
                        "   @end_at" +
                        "); ";

                for (int i = 0; i < _data.StartAt.Count; i++)
                {
                    using (var cmd = new NpgsqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@date", date);
                        cmd.Parameters.AddWithValue("@start_at", _data.StartAt[i]);
                        cmd.Parameters.AddWithValue("@end_at", _data.EndAt[i]);

                        cmd.ExecuteNonQuery();
                    }    
                }
            }

            response.Result = true;
            response.Message = $"Расписание за {date.ToString("dd-MM-yyyy")} успешно опубликованно!";

            response.obj = _data;
            
            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при получение расписания!";
#endif
            response.obj = _data;
            
            return BadRequest(response);
        }
    }

    [HttpPost]
    [Route("delete_by_date")]
    public IActionResult DeleteByDate([FromForm]DateTime date)
    {
        var response = new APIResponse();

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query;

                query = "DELETE FROM schedules_details " +
                        "WHERE schedule_id = (SELECT id FROM schedules WHERE study_date = @date); " +
                        "DELETE FROM schedules_times " +
                        "WHERE schedule_id = (SELECT id FROM schedules WHERE study_date = @date); " +
                        "DELETE FROM schedules " +
                        "WHERE study_date = @date; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@date", date);

                    cmd.ExecuteNonQuery();
                }

                response.Result = true;
                response.Message = $"Расписание за {date.ToString("dd-MM-yyyy")} успешно удаленно!";

                return Ok(response);
            }
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при получение расписания!";
#endif
            return BadRequest(response);
        }
    }
}