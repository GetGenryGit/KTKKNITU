using System.Text.Json.Serialization;

namespace OperatorApp_Client.MVVMS.Models;

public class HistoryItem
{
    [JsonPropertyName("event_describe")]
    public string EventDescribe { get; set; }
    [JsonPropertyName("date_created")]
    public DateTime DateCreated { get; set; }
}
