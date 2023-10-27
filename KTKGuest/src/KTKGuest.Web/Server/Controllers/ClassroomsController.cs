using System.Data;
using System.Text.Json;
using KTKGuest.WebComponents.Data;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace KTKGuest.Web.Server.Controllers;

[Route("api/[controller]")]
[ApiController]
public class ClassroomsController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private string _connectionString;
    
    public ClassroomsController(IConfiguration configuration)
    {
        _configuration = configuration;
        _connectionString = _configuration.GetConnectionString("PostgreConnectionString") ?? throw new Exception();
    }
    
    // GET: api/classrooms/get
    [HttpGet]
    [Route("[action]")]
    public IActionResult Get()
    {
        var response = new APIResponse();
        var dt = new DataTable();

        var list = new List<string>();

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query = "SELECT " +
                               "title " +
                               "FROM classrooms " +
                               "WHERE status = '1'; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                foreach (DataRow row in dt.Rows)
                {
                    list.Add((string)row["title"]);
                }
            }

            response.Result = true;
            response.Message = "Справочники кабинетов успешно получены!";

            response.obj = list;
            
            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при получение справочников кабинетов!";
#endif
            
            return BadRequest(response);
        }

    }

    // POST: api/classrooms/send
    [HttpPost]
    [Route("[action]")]
    public IActionResult Add([FromForm] Dictionary<string,string> postForm)
    {
        var response = new APIResponse();

        try
        {
            if (string.IsNullOrWhiteSpace(postForm["list"]))
            {
                response.Result = false;
                response.Message = "Параметр list не может быть пустым!";
                
                return BadRequest(response);
            }

            var list = JsonSerializer.Deserialize<List<string>>(postForm["list"]);

            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();
                
                string query;
                
                query = "UPDATE classrooms " +
                        "SET status = '0'; ";
                
                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.ExecuteNonQuery();
                }

                query = "INSERT INTO classrooms(title) " +
                        "VALUES(@item) " +
                        "ON CONFLICT(title) DO " +
                        "UPDATE " +
                        "SET status = '1'; ";

                foreach (var item in list)
                {
                    using (var cmd = new NpgsqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@item", item);

                        cmd.ExecuteNonQuery();
                    }
                }

                query = "INSERT INTO logs(event_describe, role_id) " +
                        "VALUES('Справочник кабинетов успешно синхронизирован!', (SELECT id FROM roles WHERE title = 'О.Р.')); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }

            response.Result = true;
            response.Message = "Справочник кабинетов успешно синхронизирован!";

            response.obj = list;
            
            return Ok(response);
        }
        catch (Exception ex)
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query;
                query = "INSERT INTO logs(event_describe, role_id) " +
                        "VALUES('При синхронизации справочника кабинетов произошел сбой!', (SELECT id FROM roles WHERE title = 'О.Р.')); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }

            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при получение справочников кабинетов!";
#endif
            return BadRequest(response);
        }
    }
}