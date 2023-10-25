﻿using System.Data;
using System.Text.Json;
using KTKGuest.WebComponents.Data;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace KTKGuest.Web.Server.Controllers;

[Route("api/[controller]")]
[ApiController]
public class TeachersController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private string _connectionString;
    
    public TeachersController(IConfiguration configuration)
    {
        _configuration = configuration;
        _connectionString = _configuration.GetConnectionString("PostgreConnectionString");
    }
    
    // GET: api/teachers/get
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
                               "FROM teachers " +
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
            response.Message = "Справочники учителей успешно получены!";

            response.obj = list;
            
            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при получение справочников учителей!";
#endif
            return BadRequest(response);
        }

    }

    // POST: api/teachers/send
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
                
                query = "UPDATE teachers " +
                        "SET status = '0'; ";
                
                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.ExecuteNonQuery();
                }

                query = "INSERT INTO teachers(title) " +
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
            }

            response.Result = true;
            response.Message = "Справочник учителей успешно синхронизирован!";

            response.obj = list;
            
            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при получение справочников учителей!";
#endif
            return BadRequest(response);
        }
    }
    
}