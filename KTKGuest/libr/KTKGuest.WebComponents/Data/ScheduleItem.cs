using System.Text.Json.Serialization;

namespace KTKGuest.WebComponents.Data;

public class ScheduleItem
{
    [JsonPropertyName("class_index")]
    public int ClassIndex { get; set; }
    [JsonPropertyName("teacher")]
    public string Teacher { get; set; }
    [JsonPropertyName("subject")]
    public string Subject { get; set; }
    [JsonPropertyName("collective")]
    public string Collective { get; set; }
    [JsonPropertyName("classroom")]
    public string Classroom { get; set; }
    [JsonPropertyName("sub_group")]
    public int SubGroup { get; set; }
}