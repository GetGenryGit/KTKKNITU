using KTKAdmin.Abstracts.Services;
using KTKAdmin.Abstracts.ViewModels.Layouts;
using KTKAdmin.Abstracts.ViewModels.Main;
using KTKAdmin.Abstracts.ViewModels.StartUp;
using KTKAdmin.Services;
using KTKAdmin.ViewModels.Layouts;
using KTKAdmin.ViewModels.Main;
using KTKAdmin.ViewModels.StartUp;

namespace KTKAdmin;

public static class Dependecies
{
    public static IServiceCollection AddViewModels(this IServiceCollection services)
    {
        services.AddScoped<IMainLayoutVM, MainLayoutVM>();

        services.AddTransient<ISignInVM, SignInVM>();

        services.AddTransient<IDictionariesVM, DictionariesVM>();
        services.AddScoped<ISchedulePublisherVM, SchedulePublisherVM>();
        services.AddScoped<IScheduleCollectiveItemVM, ScheduleCollectiveItemVM>();
        services.AddTransient<IScheduleLogsVM, ScheduleLogsVM>();

        services.AddScoped<IUsersPanelVM, UsersPanelVM>();
        services.AddScoped<IUserFormVM, UserFormVM>();
        services.AddTransient<IUsersLogsVM, UsersLogsVM>();

        return services;
    }

    public static IServiceCollection AddServices(this IServiceCollection services)
    {
        services.AddTransient<IHttpService, HttpService>();
        services.AddTransient<IDisplayAlertService, DisplayAlertService>();
        services.AddTransient<IExcelService, ExcelService>();
        services.AddTransient<IPickUpFileService, PickUpFileService>();
        services.AddTransient<IAccessService, AccessService>();
        services.AddTransient<IPreferenceService, PreferenceService>();

        return services;
    }
}
