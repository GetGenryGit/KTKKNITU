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

    /*public static string Login = url + "api/auth/login";

    public static string GetAllUsers = url + "api/users/GetAll";
    public static string CreateUser = url + "api/users/Create";
    public static string UpdateUser = url + "api/users/Update";
    public static string DeleteUser = url + "api/users/Delete";

    public static string GetLogsAdmin = url + "api/logs/getlogsadmin";
    public static string GetLogsOperator = url + "api/logs/getlogsoperator";*/
}
