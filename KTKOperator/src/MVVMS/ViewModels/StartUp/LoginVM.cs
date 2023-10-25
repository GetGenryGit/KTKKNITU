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

    private User userAuth = new User();
    public User UserAuth {
        get => userAuth;
        set => userAuth = value;
    }
    #endregion

    #region [SecondoryMethods]
    private void LoadingChange(bool state)
        => IsLoading = state;

    /*private async Task<APIResponse> LoginUser(User userAuth)
    {
        string userAuthJson = JsonSerializer.Serialize(userAuth);

        var loginPost = new Dictionary<string, string>
        {
              { "API_KEY", APIConstants.token },
              { "obj", userAuthJson }
        };

        return await httpService.POST(APIConstants.Login, loginPost);
    }*/
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
                var userAuthentication = new User
                {
                    Login = preferencesService.LoginPreference,
                    Password = preferencesService.PasswordPreference
                };

                await Login(userAuthentication);
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
    public async Task Login(User userAuthentication)
    {
        try
        {
            LoadingChange(true);

            userAuthentication.Login = userAuthentication.Login.Trim();
            userAuthentication.Password = userAuthentication.Password.Trim();

            /*APIResponse responseLogin = await LoginUser(userAuthentication);*/

            /*if (!responseLogin.Result)
            {
                LoadingChange(false);

                await displayAlertService.DisplayMessage(
                    "Ошибка",
                    responseLogin.Message,
                    "ОК");

                return;
            }*/

            preferencesService.LoginPreference = userAuthentication.Login;
            preferencesService.PasswordPreference = userAuthentication.Password;



/*            var sessionUserDetails = JsonSerializer.Deserialize<UserDetails>(responseLogin.JsonContent);
*/
            var user = new UserDetails
            {
                FirstName = "Оператор",
                Role = "О.Р."
            };

            var autenticacionExt = (AuthenticationService)AuthenticationProvider;
            await autenticacionExt.ActualizerAuthInf(user);

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
