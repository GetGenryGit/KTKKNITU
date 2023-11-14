using System.Data;
using System.Text.Json;
using KTKGuest.WebComponents.Data;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace KTKGuest.Web.Server.Controllers;

[Route("api/[controller]")]
[ApiController]
public class CollectivesController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private string _connectionString;
    
    public CollectivesController(IConfiguration configuration)
    {
        _configuration = configuration;
        _connectionString = _configuration.GetConnectionString("PostgreConnectionString") ?? throw new Exception();
    }
    
    // GET: api/collectives/get
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
                               "FROM collectives " +
                               "WHERE status = '1' " +
                               "ORDER BY title ASC; ";

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
            response.Message = "Справочники групп успешно получены!";

            response.obj = list;
            
            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при получение справочников групп!";
#endif
            return BadRequest(response);
        }

    }

    //GET: api/collectives/get_all
    [HttpGet]
    [Route("get_all")]
    public IActionResult GetAll()
    {
        var response = new APIResponse();
        var dt = new DataTable();

        var list = new List<DictionaryItem>();

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query = "SELECT id, title, status " +
                               "FROM collectives " +
                               "ORDER BY id ASC; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                foreach (DataRow row in dt.Rows)
                {
                    list.Add(new DictionaryItem
                    {
                        Id = (int)row["id"],
                        Title = (string)row["title"],
                        Status = (bool)row["status"]
                    });
                }
            }

            response.Result = true;
            response.Message = "Справочники активных и неактивных групп успешно получены!";

            response.obj = list;

            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при получение справочников активных и неактивных групп!";
#endif
            return BadRequest(response);
        }
    }

    // POST: api/collectives/send
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
                
                query = "UPDATE collectives " +
                        "SET status = '0'; ";
                
                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.ExecuteNonQuery();
                }

                query = "INSERT INTO collectives(title) " +
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
                        "VALUES('Справочник групп успешно синхронизирован!', (SELECT id FROM roles WHERE title = 'О.Р.')); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }

            response.Result = true;
            response.Message = "Справочник групп успешно синхронизирован!";

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
                        "VALUES('При синхронизации справочника групп произошел сбой!', (SELECT id FROM roles WHERE title = 'О.Р.')); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }

            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при получение справочников групп!";
#endif
            
            return BadRequest(response);
        }
    }
}