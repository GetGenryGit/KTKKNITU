namespace OperatorApp_Client.MVVMS.Models;

public class ScheduleObj
{
    public List<ScheduleItemObj> ScheduleItems { get; set; } = new List<ScheduleItemObj>();
}
public class ScheduleItemObj
{
    public string Title { get; set; } = "Empty Title";
    public List<LessonItemObj> LessonItems { get; set; } = new List<LessonItemObj>(); 
}
public class LessonItemObj
{
    public int Index { get; set; }
    public TimeSpan StartAt { get; set; }
    public TimeSpan EndAt { get; set; }
    public List<ItemObj> Items { get; set; } = new List<ItemObj>();
}
public class ItemObj
{
    public string Title1 { get; set; } = "Empty Title1";
    public string Title2 { get; set; } = "Empty Title2";
    public string Title3 { get; set; } = "Empty Title3";
    public int SubGroup { get; set; }
}
