using Blazored.SessionStorage;
using System.Text.Json;

public static class SessionStorageService
{
    public static async Task SetStorageItem<T>(
    this ISessionStorageService sessionStorageService,
    string key, T item) where T : class
    {
        string itemJson = JsonSerializer.Serialize(item);
        await sessionStorageService.SetItemAsStringAsync(key, itemJson);
    }

    public static async Task<T?> GetStorageItem<T>(
    this ISessionStorageService sessionStorageService,
    string key) where T : class
    {
        string itemJson = await sessionStorageService.GetItemAsStringAsync(key);

        if (itemJson != null)
        {
            T item = JsonSerializer.Deserialize<T>(itemJson);
            return item;
        }
        else
        {
            return null;
        }
    }
}

