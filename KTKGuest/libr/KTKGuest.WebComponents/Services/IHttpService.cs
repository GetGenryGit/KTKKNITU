using KTKGuest.WebComponents.Data;

namespace KTKGuest.WebComponents.Services;

public interface IHttpService
{
    Task<APIResponse> POST(string url, Dictionary<string, string> formDictionary);
    Task<APIResponse> GET(string url);
}