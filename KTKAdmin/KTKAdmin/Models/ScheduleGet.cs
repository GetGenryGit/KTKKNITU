using System.Text.Json.Serialization;

namespace KTKAdmin.Models;

public class ScheduleGet
{
    [JsonPropertyName("start_at")]
    public List<TimeSpan> startTimeList { get; set; }
    [JsonPropertyName("end_at")]
    public List<TimeSpan> endTimeList { get; set; }
    [JsonPropertyName("schedule_obj_data")]
    public ScheduleObj scheduleObjList { get; set; } = new ScheduleObj();
    [JsonPropertyName("schedule_list_data")]
    public List<ScheduleItem> scheduleList { get; set; } = new List<ScheduleItem>();
}
