using Blazored.SessionStorage;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.Extensions.Logging;
using OperatorApp_Client.Interfaces.Services;
using OperatorApp_Client.Interfaces.ViewModels.Main.Admin;
using OperatorApp_Client.Interfaces.ViewModels.Main.Operator;
using OperatorApp_Client.Interfaces.ViewModels.StartUp;
using OperatorApp_Client.MVVMS.Services;
using OperatorApp_Client.MVVMS.ViewModels.Main.Admin;
using OperatorApp_Client.MVVMS.ViewModels.Main.Operator;
using OperatorApp_Client.MVVMS.ViewModels.StartUp;

namespace OperatorApp_Client
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });

            builder.Services.AddMauiBlazorWebView();

#if DEBUG
		builder.Services.AddBlazorWebViewDeveloperTools();
		builder.Logging.AddDebug();
#endif

            #region [Services]
            builder.Services.AddBlazoredSessionStorage();
            builder.Services.AddScoped<AuthenticationStateProvider, AuthenticationService>();
            builder.Services.AddAuthorizationCore();

            builder.Services.AddSingleton<IHttpService, HttpService>();
            builder.Services.AddTransient<IDisplayAlertService, DisplayAlertService>();
            builder.Services.AddTransient<IExcelService, ExcelService>();
            builder.Services.AddSingleton<IPickUpFileService, PickUpFileService>();
            builder.Services.AddSingleton<IAccessService, AccessService>();
            builder.Services.AddSingleton<IPreferencesService, PreferencesService>(); 
            #endregion

            #region [ViewModels]

            builder.Services.AddSingleton<ILoginVM, LoginVM>();

            builder.Services.AddSingleton<IDictionaryVM, DictionaryVM>();
            builder.Services.AddSingleton<IScheduleVM, ScheduleVM>();
            builder.Services.AddSingleton<IScheduleItemVM, ScheduleItemVM>();
            builder.Services.AddSingleton<IHistoryOfScheduleVM, HistoryOfScheduleVM>();

            builder.Services.AddSingleton<IAdminPanelVM, AdminPanelVM>();
            builder.Services.AddSingleton<IUserEditVM, UserEditVM>();
            builder.Services.AddSingleton<IHistoryOfDoingVM, HistoryOfDoingVM>();

            #endregion


            return builder.Build();
        }
    }
}