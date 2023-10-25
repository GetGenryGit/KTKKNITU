using Blazored.LocalStorage;
using Microsoft.Extensions.Logging;
using KTKGuest.WebComponents.Services;

namespace KTKGuest.App;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .ConfigureFonts(fonts => { fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular"); });

        builder.Services.AddMauiBlazorWebView();

#if DEBUG
        builder.Services.AddBlazorWebViewDeveloperTools();
        builder.Logging.AddDebug();
#endif

        builder.Services.AddTransient<IHttpService, HttpService>();
        builder.Services.AddBlazoredLocalStorage();
        builder.Services.AddScoped<IToastService, ToastService>();


        return builder.Build();
    }
}