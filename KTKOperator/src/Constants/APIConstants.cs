namespace OperatorApp_Client.Constants;

public class APIConstants
{
#if DEBUG
    public static string Url = "https://localhost:7170/";
#else
    public static string Url = "https://ktkknitu.ru/";
#endif

    public static string token { get; set; } = string.Empty;

    public static string GroupsAdd = Url + "api/collectives/add";
    public static string TeachersAdd = Url + "api/teachers/add";
    public static string SubjectsAdd = Url + "api/subjects/add";
    public static string ClassroomAdd = Url + "api/classrooms/add";

    public static string ScheduleAdd = Url + "api/schedules/add";
    public static string ScheduleDelete = Url + "api/schedules/delete_by_date";

    public static string Login = Url + "api/users/login";

    public static string GetAllUsers = Url + "api/users/get";
    public static string CreateUser = Url + "api/users/add";
    public static string UpdateUser = Url + "api/users/put";
    public static string DeleteUser = Url + "api/users/delete_by_id";

    public static string GetLogs = Url + "api/logs/get";

    public static string NotificationSend = Url + "api/notifications/send";
}
