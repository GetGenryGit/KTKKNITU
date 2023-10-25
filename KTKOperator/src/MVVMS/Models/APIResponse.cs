using System.Text.Json.Serialization;

namespace OperatorApp_Client.MVVMS.Models;

public class APIResponse
{
    [JsonPropertyName("result")]
    public bool Result { get; set; }
    [JsonPropertyName("message")]
    public string Message { get; set; } = "Empty";
    [JsonPropertyName("json_content")]
    public string JsonContent { get; set; } = "Empty";

}
