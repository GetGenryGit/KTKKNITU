using System.Text.Json.Serialization;

namespace OperatorApp_Client.MVVMS.Models;

public class ScheduleItem
{
    [JsonPropertyName("class_index")]
    public int ClassIndex { get; set; }
    [JsonPropertyName("teacher")]
    public string Teacher { get; set; }
    [JsonPropertyName("collective")]
    public string Collective { get; set; } 
    [JsonPropertyName("classroom")]
    public string Classroom { get; set; }
    [JsonPropertyName("subject")]
    public string Subject { get; set; }
    [JsonPropertyName("sub_group")]
    public int SubGroup { get; set; }
}