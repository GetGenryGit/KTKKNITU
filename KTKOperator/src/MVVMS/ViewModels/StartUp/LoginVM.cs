using OperatorApp_Client.Interfaces.Services;
using OperatorApp_Client.Interfaces.ViewModels.StartUp;
using OperatorApp_Client.MVVMS.Models;
using System.Text.Json;
using OperatorApp_Client.MVVMS.Services;
using OperatorApp_Client.Constants;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components;

namespace OperatorApp_Client.MVVMS.ViewModels.StartUp;

public class LoginVM : ILoginVM
{
    #region [Constructors]
    private IDisplayAlertService displayAlertService;
    private IHttpService httpService;
    private IPreferencesService preferencesService;
    public AuthenticationStateProvider AuthenticationProvider { get; set; }
    public NavigationManager NavigationService { get; set; }
    public LoginVM(IDisplayAlertService displayAlertService,
        IHttpService httpService, IPreferencesService preferencesService)
    {
        this.displayAlertService = displayAlertService;
        this.httpService = httpService;
        this.preferencesService = preferencesService;
    }
    #endregion

    #region [Properties]
    private bool isLoading;
    public bool IsLoading 
    {
        get => isLoading;
        set => isLoading = value;
    }
    public string Login { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
    #endregion

    #region [SecondoryMethods]
    private void LoadingChange(bool state)
        => IsLoading = state;

    private async Task<APIResponse> LoginUser(string login, string password)
    {
        var loginPost = new Dictionary<string, string>
        {
/*              { "API_KEY", APIConstants.token },
*/              { "login", login },
                { "password", password }
        };

        return await httpService.POST(APIConstants.Login, loginPost);
    }
    #endregion

    #region [MainMethods]
    public async Task InitilizedVMAsync()
    {
        try
        {
            LoadingChange(true);

            if (!string.IsNullOrWhiteSpace(preferencesService.LoginPreference)
                && !string.IsNullOrWhiteSpace(preferencesService.PasswordPreference))
            {
                string login = preferencesService.LoginPreference;
                string password = preferencesService.PasswordPreference;

                await LoginCompletly(login, password);
            }

            LoadingChange(false);
        }
        catch (Exception ex) 
        {
            LoadingChange(false);

            await displayAlertService.DisplayMessage(
                "Исключение",
                ex.Message,
                "ОК");
        }

    }
    public void InitilizedVM()
    {
        throw new NotImplementedException();
    }
    public async Task LoginCompletly(string login, string password)
    {
        try
        {
            LoadingChange(true);

            APIResponse responseLogin = await LoginUser(login, password);

            if (!responseLogin.Result)
            {
                LoadingChange(false);

                await displayAlertService.DisplayMessage(
                    "Ошибка",
                    responseLogin.Message,
                    "ОК");

                return;
            }

            preferencesService.LoginPreference = login.Trim();
            preferencesService.PasswordPreference = password.Trim();

            var sessionUserDetails = JsonSerializer.Deserialize<UserDetails>(responseLogin.Obj.ToString());

            var autenticacionExt = (AuthenticationService)AuthenticationProvider;
            await autenticacionExt.ActualizerAuthInf(sessionUserDetails);

            NavigationService.NavigateTo("/dictionary", true);

            LoadingChange(false);
        }
        catch (Exception ex) 
        {
            LoadingChange(false);

            await displayAlertService.DisplayMessage(
                "Исключение",
                ex.Message,
                "ОК");
        }
    }
    #endregion
}
