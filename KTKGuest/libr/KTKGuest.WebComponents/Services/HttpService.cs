using System.Text.Json;
using KTKGuest.WebComponents.Data;

namespace KTKGuest.WebComponents.Services;

public class HttpService : IHttpService
{
    public async Task<APIResponse> POST(string url, Dictionary<string, string> formDictionary)
    {
        using (var client = new HttpClient())
        {
            var formContent = new FormUrlEncodedContent(formDictionary);

            var response = await client.PostAsync(url, formContent);

            var resultJson = await response.Content.ReadAsStringAsync();

            return JsonSerializer.Deserialize<APIResponse>(resultJson);
        }
    }
    
    public async Task<APIResponse> GET(string url)
    {
        using (var client = new HttpClient())
        {
            var response = await client.GetAsync(url);

            var resultJson = await response.Content.ReadAsStringAsync();

            return JsonSerializer.Deserialize<APIResponse>(resultJson);
        }
    }
}