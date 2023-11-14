﻿using KTKAdmin.Models;

namespace KTKAdmin.Abstracts.Services;

public interface IHttpService
{
    Task<APIResponse> POST(string url, Dictionary<string, string> formDictionary);
    Task<APIResponse> GET(string url);
    Task<APIResponse> PUT(string url, Dictionary<string, string> formDictionary);
}