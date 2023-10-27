using Microsoft.AspNetCore.Components;
using OperatorApp_Client.Constants;
using OperatorApp_Client.Interfaces.Services;
using OperatorApp_Client.Interfaces.ViewModels.Main.Admin;
using OperatorApp_Client.MVVMS.Models;
using System.Text.Json;

namespace OperatorApp_Client.MVVMS.ViewModels.Main.Admin;

public class UserEditVM : IUserEditVM
{
    #region [Constructors]
    private IDisplayAlertService displayAlertService;
    private IHttpService httpService;
    public NavigationManager NavigationService { get; set; }

    public UserEditVM(IDisplayAlertService displayAlertService, IHttpService httpService)
    {
        this.displayAlertService = displayAlertService;
        this.httpService = httpService;
    }
    #endregion

    #region [Properties]
    private bool isLoading;
    public bool IsLoading
    {
        get => isLoading;
        set => isLoading = value;
    }

    private UserDetails userInf = new UserDetails();
    public UserDetails UserInf
    {
        get => userInf;
        set => userInf = value;
    }
    #endregion

    #region [SecondoryMethods]
    private void LoadingChange(bool state)
        => IsLoading = state;

    private async Task<APIResponse> DeleteByIdUser(UserDetails user)
    {
        var userConverted = JsonSerializer.Serialize(user);

        var postDataDeleteUser = new Dictionary<string, string>
        {
/*             { "API_KEY", APIConstants.token },
*/             { "userDetails", userConverted }
        };

        return await httpService.POST(APIConstants.DeleteUser, postDataDeleteUser);
    }

    private async Task<APIResponse> PutUser(UserDetails user)
    {
        var userConverted = JsonSerializer.Serialize(user);

        var postDataUpdateUser = new Dictionary<string, string>
        {
/*             { "API_KEY", APIConstants.token },
*/             { "userDetails", userConverted }
        };

        return await httpService.PUT(APIConstants.UpdateUser, postDataUpdateUser);
    }

    private async Task<APIResponse> AddUser(UserDetails user)
    {
        var userConverted = JsonSerializer.Serialize(user);

        var postDataCreateUser = new Dictionary<string, string>
        {
/*             { "API_KEY", APIConstants.token },
*/             { "userDetails", userConverted }
        };

        return await httpService.POST(APIConstants.CreateUser, postDataCreateUser);
    }
    #endregion

    #region [MainMethods]
    public Task InitilizedVMAsync()
    {
        throw new NotImplementedException();
    }
    public void InitilizedVM()
    {
        throw new NotImplementedException();
    }
    public async Task Delete(UserDetails userEdited)
    {
        try
        {
            LoadingChange(true);

            bool dialogResult = await displayAlertService.DisplayDialog(
                "Удаление пользователя",
                "Вы уверены что хотите удалить пользователя",
                "Да", "Нет");

            if (!dialogResult)
            {
                LoadingChange(false);
                return;
            }

            APIResponse response = await DeleteByIdUser(userEdited);

            if (!response.Result)
            {
                await App.Current.MainPage.DisplayAlert(
                    "Ошибка!",
                    response.Message,
                    "OK");
            }
            else
            {
                await App.Current.MainPage.DisplayAlert(
                    "Успех!",
                    "Пользователь успешно удален!",
                    "OK");

                NavigationService.NavigateTo("/admin_panel", false, true);

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
    public async Task Save(UserDetails userEdited)
    {
        try
        {
            LoadingChange(true);

            if (userEdited.Id == 0)
            {
                APIResponse response = await AddUser(userEdited);

                if (!response.Result)
                {
                    await App.Current.MainPage.DisplayAlert(
                        "Ошибка!",
                        response.Message,
                        "OK");
                }
                else
                {
                    await App.Current.MainPage.DisplayAlert(
                        "Успех!",
                        "Пользователь успешно создан!",
                        "OK");

                    NavigationService.NavigateTo("/admin_panel", false, true);

                }
            }
            else
            {
                APIResponse response = await PutUser(userEdited);

                if (!response.Result)
                {
                    await App.Current.MainPage.DisplayAlert(
                        "Ошибка при создание пользователя!",
                        response.Message,
                        "OK");
                }
                else
                {
                    await App.Current.MainPage.DisplayAlert(
                        "Успех!",
                        "Пользователь успешно обновлен!",
                        "OK");

                    NavigationService.NavigateTo("/admin_panel", false, true);
                }
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
    #endregion
}
