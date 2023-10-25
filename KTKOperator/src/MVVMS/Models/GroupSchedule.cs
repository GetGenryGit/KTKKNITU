namespace OperatorApp_Client.MVVMS.Models;

public class GroupSchedule
{
    public string Title { get; set; } = "Not Found";
    public List<GroupLesson> GroupLessons { get; set; }
}

public class GroupLesson
{
    public int LessonIndex { get; set; }
    public TimeOnly StartAt { get; set; }
    public TimeOnly EndAt { get; set; }
    public string Teacher { get; set; } = "Empty";
    public string Classroom { get; set; } = "Empty";
    public string Subject { get; set; } = "Empty";
    public int? SubGroup { get; set; }
}
