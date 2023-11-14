using System.Text.Json.Serialization;

namespace KTKAdmin.Models;

public class HistoryItem
{
    [JsonPropertyName("event_describe")]
    public string EventDescribe { get; set; }
    [JsonPropertyName("date_created")]
    public DateTime DateCreated { get; set; }
}
