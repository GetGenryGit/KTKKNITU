using System.Text.Json;
using OperatorApp_Client.Interfaces.Services;
using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.MVVMS.Services;

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
}
