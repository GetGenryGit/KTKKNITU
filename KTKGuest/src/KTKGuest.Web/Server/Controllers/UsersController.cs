using KTKGuest.Server.Helpers;
using KTKGuest.WebComponents.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Npgsql;
using System.Collections.Generic;
using System.Data;
using System.Text.Json;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace KTKGuest.Web.Server.Controllers;

[Route("api/[controller]")]
[ApiController]
public class UsersController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private string _connectionString;

    public UsersController(IConfiguration configuration)
    {
        _configuration = configuration;
        _connectionString = _configuration.GetConnectionString("PostgreConnectionString") ?? throw new Exception();
    }

    // GET: api/users/get
    [HttpGet]
    [Route("[action]")]
    public IActionResult Get()
    {
        var response = new APIResponse();

        var dt = new DataTable();
        var list = new List<UserDetails>();

        try
        {

            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query;

                query = "SELECT id, login, (SELECT title FROM roles WHERE id = role_id) as role FROM users; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }
            }

            foreach (DataRow row in dt.Rows)
            {
                list.Add(new UserDetails
                {
                    Id = (int)row["id"],
                    Login = (string)row["login"],
                    Role = (string)row["role"]
                });
            }

            response.Result = true;
            response.Message = "Список пользователей успешно получен";

            response.obj = list;

            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при попытке получить пользователей!";
#endif
            return BadRequest(response);
        }
    }

    // POST: api/users/login
    [HttpPost]
    [Route("[action]")]
    public IActionResult Login([FromForm] Dictionary<string, string> postForm)
    {
        var response = new APIResponse();
        var dt = new DataTable();

        try
        {
            var userDetails = new UserDetails();

            if (string.IsNullOrWhiteSpace(postForm["login"]))
            {
                response.Result = false;
                response.Message = "Пустое поле логин!";

                return BadRequest(response);
            }

            if (string.IsNullOrWhiteSpace(postForm["password"]))
            {
                response.Result = false;
                response.Message = "Пустое поле пароль!";

                return BadRequest(response);
            }

            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query;

                query = "SELECT login, (SELECT title from roles WHERE id = role_id) as role " +
                        "FROM users " +
                        "WHERE login = @login AND pass = @pass; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", postForm["login"].ToLower());
                    cmd.Parameters.AddWithValue("@pass", HashPasswordHelper.HashPassword(postForm["password"]));

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count < 1)
                {
                    response.Result = false;
                    response.Message = "Неправильный логин или пароль!";

                    return BadRequest(response);
                }

                foreach (DataRow row in dt.Rows) 
                {
                    userDetails.Login = (string)row["login"];
                    userDetails.Role = (string)row["role"];
                }
            }

            response.Result = true;
            response.Message = "Пользователь успешно вошел в систему!";
            response.obj = userDetails;

            return Ok(response);
        }
        catch (Exception ex) 
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при попытке авторизации!";
#endif
            return BadRequest(response);
        }
    }

    // POST: api/users/add
    [HttpPost]
    [Route("[action]")]
    public IActionResult Add([FromForm] Dictionary<string, string> postForm)
    {
        var response = new APIResponse();
        var dt = new DataTable();

        try
        {
            if (string.IsNullOrWhiteSpace(postForm["userDetails"]))
            {
                response.Result = false;
                response.Message = "Пустой параметр userDetails!";

                return BadRequest(response);
            }

            var userDetails = JsonSerializer.Deserialize<UserDetails>(postForm["userDetails"]);

            if (string.IsNullOrWhiteSpace(userDetails.Login))
            {
                response.Result = false;
                response.Message = "Пустой поле логин";

                return BadRequest(response);
            }

            if (string.IsNullOrWhiteSpace(userDetails.Password))
            {
                response.Result = false;
                response.Message = "Пустой поле пароль";

                return BadRequest(response);
            }

            if (string.IsNullOrWhiteSpace(userDetails.Role))
            {
                response.Result = false;
                response.Message = "Пустой поле роль";

                return BadRequest(response);
            }

            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query;

                query = "SELECT login " +
                        "FROM users " +
                        "WHERE login = @login;";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", userDetails.Login.ToLower());

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count != 0)
                {
                    response.Result = false;
                    response.Message = "Такой логин уже существует";

                    return BadRequest(response);
                }

                query = "INSERT INTO users " +
                        "( " +
                        "   login, " +
                        "   pass, " +
                        "   role_id " +
                        ") " +
                        "VALUES" +
                        "( " +
                        "   @login, " +
                        "   @pass, " +
                        "   (SELECT id FROM roles WHERE title = @role) " +
                        "); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", userDetails.Login.ToLower());
                    cmd.Parameters.AddWithValue("@pass", HashPasswordHelper.HashPassword(userDetails.Password));
                    cmd.Parameters.AddWithValue("@role", userDetails.Role);

                    cmd.ExecuteNonQuery();
                }

                query = "INSERT INTO logs(event_describe, role_id) " +
                        $"VALUES('Пользователь {userDetails.Login} успешно создан!', (SELECT id FROM roles WHERE title = 'А.П.')); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }

            response.Result = true;
            response.Message = $"Пользователь под логином {userDetails.Login.ToLower()} успешно добавлен!";

            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при попытке добавить пользователя!";
#endif
            return BadRequest(response);
        }
    }

    // POST: api/users/put
    [HttpPut]
    [Route("[action]")]
    public IActionResult Put([FromForm] Dictionary<string, string> postForm) 
    {
        var response = new APIResponse();

        try
        {
            if (string.IsNullOrWhiteSpace(postForm["userDetails"]))
            {
                response.Result = false;
                response.Message = "Пустой параметр userDetails!";

                return BadRequest(response);    
            }

            var userDetails = JsonSerializer.Deserialize<UserDetails>(postForm["userDetails"]);

            if (userDetails.Id == 0)
            {
                response.Result = false;
                response.Message = "Пустой поле ID";

                return BadRequest(response);
            }

            if (string.IsNullOrWhiteSpace(userDetails.Login))
            {
                response.Result = false;
                response.Message = "Пустой поле логин";

                return BadRequest(response);
            }

            if (string.IsNullOrWhiteSpace(userDetails.Password))
            {
                response.Result = false;
                response.Message = "Пустой поле пароль";

                return BadRequest(response);
            }

            if (string.IsNullOrWhiteSpace(userDetails.Role))
            {
                response.Result = false;
                response.Message = "Пустой поле Роль";

                return BadRequest(response);
            }

            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query;

                query = "UPDATE users " +
                        "SET login = @login, pass = @pass,role_id = (SELECT id FROM roles WHERE title = @role) " +
                        "WHERE id = @id; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", userDetails.Login.ToLower());
                    cmd.Parameters.AddWithValue("@pass", HashPasswordHelper.HashPassword(userDetails.Password));
                    cmd.Parameters.AddWithValue("@role", userDetails.Role);
                    cmd.Parameters.AddWithValue("@id", userDetails.Id);

                    cmd.ExecuteNonQuery();
                }

                query = "INSERT INTO logs(event_describe, role_id) " +
                        $"VALUES('Пользователь {userDetails.Login} были внесены изменения!', (SELECT id FROM roles WHERE title = 'А.П.')); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }

            response.Result = true;
            response.Message = $"Пользователь под логином {userDetails.Login} успешно изменен!";

            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при попытке изменит пользователя!";
#endif
            return BadRequest(response);
        }
    }

    // POST: api/users/delete_by_id
    [HttpPost]
    [Route("delete_by_id")]
    public IActionResult DeleteById([FromForm] Dictionary<string, string> postForm)
    {
        var response = new APIResponse();

        try
        {
            if (string.IsNullOrWhiteSpace(postForm["userDetails"]))
            {
                response.Result = false;
                response.Message = "Пустой параметр userDetails!";

                return BadRequest(response);
            }

            var userDetails = JsonSerializer.Deserialize<UserDetails>(postForm["userDetails"]);

            if (userDetails.Id == 0)
            {
                response.Result = false;
                response.Message = "Пустой поле ID";

                return BadRequest(response);
            }

            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query;

                query = "DELETE FROM users WHERE id = @id";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", userDetails.Id);

                    cmd.ExecuteNonQuery();
                }

                query = "INSERT INTO logs(event_describe, role_id) " +
                        $"VALUES('Пользователь {userDetails.Login} успешно удален!', (SELECT id FROM roles WHERE title = 'А.П.')); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }

            response.Result = true;
            response.Message = $"Пользователь успешно удален!";

            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при попытке удалить пользователя!";
#endif
            return BadRequest(response);
        }
    }
}
