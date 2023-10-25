using System.Text.Json.Serialization;

namespace KTKGuest.WebComponents.Data;

public class APIResponse
{
    [JsonPropertyName("result")]
    public bool Result { get; set; }
    [JsonPropertyName("message")]
    public string Message { get; set; } = "Empty";
    [JsonPropertyName("obj")]
    public object obj { get; set; }
}