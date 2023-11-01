using FirebaseAdmin;
using FirebaseAdmin.Messaging;
using Google.Apis.Auth.OAuth2;
using KTKGuest.WebComponents.Data;
using Microsoft.AspNetCore.Mvc;

namespace KTKGuest.Web.Server.Controllers;

[ApiController]
[Route("api/[controller]")]
public class NotificationsController : ControllerBase
{
    private readonly IConfiguration _configuration;

    public NotificationsController(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    [HttpPost]
    [Route("[action]")]
    public async Task<IActionResult> Send([FromForm] Dictionary<string, string> postForm)
    {
        var response = new APIResponse();

        try
        {
            if (FirebaseApp.DefaultInstance == null)
            {
                FirebaseApp.Create(new AppOptions
                {
                    Credential = GoogleCredential.FromFile("private_key_firebase.json")
                });
            }

            var message = new Message
            {
#if DEBUG
                Topic = "schedule_debug",
#else
                Topic = "schedule_release",
#endif
                Android = new()
                {
                    Priority = Priority.High,
                    Notification = new()
                    {
                        ChannelId = "ru.com.ilyaoleynik.ktkguest.general",
                        Title = postForm["title"],
                        Body = postForm["body"]
                    }
                }
            };

            string responseStr = string.Empty;

            responseStr = await FirebaseMessaging.DefaultInstance.SendAsync(message);

            response.Result = true;
            response.Message = "Уведомление успешно отправлено";

            response.obj = responseStr;

            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера, при отправке уведомления!";
#endif

            return BadRequest(response);
        }


    }

}
