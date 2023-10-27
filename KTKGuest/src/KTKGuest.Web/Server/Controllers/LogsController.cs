using KTKGuest.WebComponents.Data;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using System.Data;

namespace KTKGuest.Web.Server.Controllers;

[Route("api/[controller]")]
[ApiController]
public class LogsController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private string _connectionString;

    public LogsController(IConfiguration configuration)
    {
        _configuration = configuration;
        _connectionString = _configuration.GetConnectionString("PostgreConnectionString") ?? throw new Exception();
    }

    [HttpGet]
    [Route("[action]")]
    public IActionResult Get(string role)
    {
        var response = new APIResponse();

        var dt = new DataTable();
        var list = new List<HistoryItem>();

        try
        {
            if (string.IsNullOrWhiteSpace(role))
            {
                response.Result = false;
                response.Message = "Пустой параметр роль!";

                return BadRequest(response);    
            }

            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string queries;

                queries = "SELECT event_describe, date_created " +
                          "FROM logs " +
                          "WHERE role_id = (SELECT id FROM roles WHERE title = @role);";

                using (var cmd = new NpgsqlCommand(queries, conn))
                {
                    cmd.Parameters.AddWithValue("@role", role);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                foreach (DataRow row in dt.Rows)
                {
                    list.Add(new HistoryItem
                    {
                        EventDescribe = (string)row["event_describe"],
                        DateCreated = (DateTime)row["date_created"]
                    });
                }
            }

            response.Result = true;
            response.Message = $"Логи успешно получены для роли {role}!";

            response.obj = list;

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
}
