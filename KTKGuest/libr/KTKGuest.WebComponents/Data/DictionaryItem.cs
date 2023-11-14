using System.Text.Json.Serialization;

namespace KTKGuest.WebComponents.Data;

public class DictionaryItem
{
    [JsonPropertyName("id")]
    public int Id { get; set; }
    [JsonPropertyName("title")]
    public string Title { get; set; }
    [JsonPropertyName("status")]
    public bool Status { get; set; }
}
