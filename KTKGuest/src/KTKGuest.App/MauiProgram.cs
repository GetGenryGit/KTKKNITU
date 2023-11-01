using Blazored.LocalStorage;
using Microsoft.Extensions.Logging;
using KTKGuest.WebComponents.Services;
using Blazored.SessionStorage;
using Plugin.Firebase.Auth;
using Plugin.Firebase.Shared;
using Microsoft.Maui.LifecycleEvents;

#if IOS
using Plugin.Firebase.iOS;
#endif
#if ANDROID
using Plugin.Firebase.Android;
#endif


namespace KTKGuest.App;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .RegisterFirebaseServices()
            .ConfigureFonts(fonts => { fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular"); });

        builder.Services.AddMauiBlazorWebView();

#if DEBUG
        builder.Services.AddBlazorWebViewDeveloperTools();
        builder.Logging.AddDebug();
#endif

        builder.Services.AddTransient<IHttpService, HttpService>();
        builder.Services.AddBlazoredLocalStorage();
        builder.Services.AddScoped<IToastService, ToastService>();
        builder.Services.AddBlazoredSessionStorage();



        return builder.Build();
    }

    private static MauiAppBuilder RegisterFirebaseServices(this MauiAppBuilder builder)
    {
        builder.ConfigureLifecycleEvents(events =>
        {
#if IOS
            events.AddiOS(iOS => iOS.FinishedLaunching((app, launchOptions) => {
                CrossFirebase.Initialize(app, launchOptions, CreateCrossFirebaseSettings());
                return false;
            }));
#endif
#if ANDROID
            events.AddAndroid(android => android.OnCreate((activity, state) =>
                CrossFirebase.Initialize(activity, state, CreateCrossFirebaseSettings())));
#endif
        });

        builder.Services.AddSingleton(_ => CrossFirebaseAuth.Current);


        return builder;
    }

    private static CrossFirebaseSettings CreateCrossFirebaseSettings()
    {
        return new CrossFirebaseSettings(isAuthEnabled: true);
    }
}