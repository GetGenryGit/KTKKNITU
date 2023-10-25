using System.Text.Json.Serialization;

namespace OperatorApp_Client.MVVMS.Models;

public class User
{
    [JsonPropertyName("id")]
    public int Id { get; set; }
    [JsonPropertyName("login")]
    public string Login { get; set; } = string.Empty;
    [JsonPropertyName("password")]
    public string Password { get; set; } = string.Empty;
}

public class UserDetails
{
    [JsonPropertyName("first_name")]
    public string FirstName { get; set; } = string.Empty;
    [JsonPropertyName("second_name")]
    public string SecondName { get; set; } = string.Empty;
[JsonPropertyName("middle_name")]
    public string MiddleName { get; set; } = string.Empty;
    [JsonPropertyName("short_role_name")]
    public string Role { get; set; } = string.Empty;
}
