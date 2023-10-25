using System.Text.Json.Serialization;

namespace OperatorApp_Client.MVVMS.Models;

public class AdminPanelUserItem
{
    [JsonPropertyName("user")]
    public User User { get; set; }
    [JsonPropertyName("user_details")]
    public UserDetails UserDetails { get; set; }
}
