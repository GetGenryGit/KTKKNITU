using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.Interfaces.Services;

public interface IHttpService
{
    Task<APIResponse> POST(string url, Dictionary<string, string> formDictionary);
}
