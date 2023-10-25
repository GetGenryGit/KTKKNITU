using System.Text.Json.Serialization;

namespace KTKGuest.WebComponents.Data;

public class ScheduleGet
{
    [JsonPropertyName("start_at")]
    public List<TimeSpan> StartAt { get; set; } = new List<TimeSpan>();
    [JsonPropertyName("end_at")]
    public List<TimeSpan> EndAt { get; set; } = new List<TimeSpan>();
    [JsonPropertyName("schedule_list_data")]
    public List<ScheduleItem> ScheduleListData { get; set; } = new List<ScheduleItem>();
    [JsonPropertyName("schedule_obj_data")]
    public ScheduleObj ScheduleObjData { get; set; }
}