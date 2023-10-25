namespace OperatorApp_Client.Interfaces.Services;

public interface IAccessService
{
    List<object> ReadGroups(string connString);
    List<object> ReadTeachers(string connString);
    List<object> ReadSubjects(string connString);
    List<object> ReadClassroom(string connString);

}
