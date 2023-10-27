using System.Text.Json.Serialization;

namespace OperatorApp_Client.MVVMS.Models;

public class APIResponse
{
    [JsonPropertyName("result")]
    public bool Result { get; set; }
    [JsonPropertyName("message")]
    public string Message { get; set; }
    [JsonPropertyName("obj")]
    public object Obj { get; set; }

}
