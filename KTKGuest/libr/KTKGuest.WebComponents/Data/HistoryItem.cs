using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace KTKGuest.WebComponents.Data;

public class HistoryItem
{
    [JsonPropertyName("event_describe")]
    public string EventDescribe { get; set; }
    [JsonPropertyName("date_created")]
    public DateTime DateCreated { get; set; }
}
