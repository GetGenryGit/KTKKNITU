using System.Text.Json.Serialization;

namespace OperatorApp_Client.MVVMS.Models;

public class UserDetails
{
    [JsonPropertyName("id")]
    public int Id { get; set; }
    [JsonPropertyName("login")]
    public string Login { get; set; }
    [JsonPropertyName("password")]
    public string Password { get; set; }
    [JsonPropertyName("role")]
    public string Role { get; set; }
}
