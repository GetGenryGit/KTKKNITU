using KTKAdmin.Abstracts.Services;
using KTKAdmin.Abstracts.ViewModels.StartUp;
using KTKAdmin.Constansts;
using KTKAdmin.Models;
using KTKAdmin.Services;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using System.Text.Json;

namespace KTKAdmin.ViewModels.StartUp;

public class SignInVM : BaseVM, ISignInVM
{

    #region [Ctor]
    private NavigationManager navigationManager { get; set; }
    private IHttpService httpService { get; set; }
    private IDisplayAlertService alertService { get; set; }
    private IPreferenceService preferenceService { get; set; }
    private AuthenticationStateProvider authenticationProvider { get; set; }

    public SignInVM(NavigationManager NavigationManager, IHttpService HttpService, IDisplayAlertService AlertService,
        IPreferenceService PreferenceService, AuthenticationStateProvider AuthenticationProvider)
    {
        navigationManager = NavigationManager;
        httpService = HttpService;
        alertService = AlertService;
        preferenceService = PreferenceService;
        authenticationProvider = AuthenticationProvider;
        
    }
    #endregion

    #region [Properties]
    private string loginInput = string.Empty;
    public string LoginInput
    {
        get => loginInput;
        set => loginInput = value;
    }

    private string passwordInput = string.Empty;
    public string PasswordInput
    {
        get => passwordInput;
        set => passwordInput = value;
    }
    #endregion

    #region [SecondoryMethods]

    private async Task<APIResponse> SignInUser(string login, string password)
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

    public override void OnInitVM() { }

    public override async Task OnInitVMAsync()
    {
        try
        {
            ChangeLoading(true);

            if (!string.IsNullOrWhiteSpace(preferenceService.LoginPreference)
                && !string.IsNullOrWhiteSpace(preferenceService.PasswordPreference))
            {
                LoginInput = preferenceService.LoginPreference;
                PasswordInput = preferenceService.PasswordPreference;

                await SignIn();
            }

            ChangeLoading(false);
        }
        catch (Exception ex)
        {
            ChangeLoading(false);

            await alertService.DisplayMessage(
                "Исключение",
                ex.Message,
                "ОК");
        }

    }

    public async Task SignIn()
    {
        try
        {
            ChangeLoading(true);

            APIResponse responseLogin = await SignInUser(LoginInput, PasswordInput);

            if (!responseLogin.Result)
            {
                ChangeLoading(false);

                PasswordInput = string.Empty; 

                await alertService.DisplayMessage(
                    "Ошибка",
                    responseLogin.Message,
                    "ОК");

                return;
            }

            preferenceService.LoginPreference = LoginInput.Trim();
            preferenceService.PasswordPreference = PasswordInput.Trim();

            var sessionUserDetails = JsonSerializer.Deserialize<UserDetails>(responseLogin.Obj.ToString());

            var autenticacionExt = (AuthenticationService)authenticationProvider;
            await autenticacionExt.ActualizerAuthInf(sessionUserDetails);

            navigationManager.NavigateTo("/main/dictionaries", true, true);

            ChangeLoading(false);

        }
        catch (Exception ex) 
        {
            ChangeLoading(false);

            await alertService.DisplayMessage(
                "Исключение",
                ex.Message,
                "ОК");
        }
    }
    #endregion
}
