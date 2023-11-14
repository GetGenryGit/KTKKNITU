using KTKAdmin.Abstracts.Services;
using KTKAdmin.Models;
using System.Text.Json;

namespace KTKAdmin.Services;

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

    public async Task<APIResponse> PUT(string url, Dictionary<string, string> formDictionary)
    {
        using (var client = new HttpClient())
        {
            var formContent = new FormUrlEncodedContent(formDictionary);

            var response = await client.PutAsync(url, formContent);

            var resultJson = await response.Content.ReadAsStringAsync();

            return JsonSerializer.Deserialize<APIResponse>(resultJson);
        }
    }
}
