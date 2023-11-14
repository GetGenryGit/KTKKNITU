using System.Text.Json.Serialization;

namespace KTKAdmin.Models;

public class DictionaryItem
{
    [JsonPropertyName("id")]
    public int Id { get; set; }
    [JsonPropertyName("title")]
    public string Title { get; set; }
    [JsonPropertyName("status")]
    public bool Status { get; set; }
}
