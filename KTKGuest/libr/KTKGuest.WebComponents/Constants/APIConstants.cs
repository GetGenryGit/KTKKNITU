namespace KTKGuest.WebComponents.Constants;

public class APIConstants
{
#if DEBUG
    public static string Url = "https://localhost:7170/";
#else
    public static string Url = "https://ktkknitu.ru/";
#endif
 
    public static string GetCollectives = Url + "api/collectives/get";
    public static string GetTeachers = Url + "api/teachers/get";
    public static string GetClassrooms = Url + "api/classrooms/get";

    public static string GetSchedules = Url + "api/schedules/get";
}