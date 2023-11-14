using KTKAdmin.Abstracts.Services;
using KTKAdmin.Abstracts.ViewModels.Main;
using KTKAdmin.Constansts;
using KTKAdmin.Models;
using Microsoft.AspNetCore.Components;
using System.Text.Json;

namespace KTKAdmin.ViewModels.Main;

public class UserFormVM : BaseVM, IUserFormVM
{
    #region [Ctor]
    private IDisplayAlertService alertService { get;set; }
    private IHttpService httpService { get;set; }
    private NavigationManager navigationManager { get;set; }
    public UserFormVM(IDisplayAlertService AlertService, IHttpService HttpService,
        NavigationManager NavigationManager)
    {
        alertService = AlertService;
        httpService = HttpService;
        navigationManager = NavigationManager;
    }
    #endregion

    #region [Properties]
    private UserDetails userInf = new UserDetails();    
    public UserDetails UserInf 
    { 
        get => userInf; 
        set => userInf = value; 
    }

    #endregion

    #region [SecondoryMethods]
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
    public override void OnInitVM() { }

    public override async Task OnInitVMAsync() { }

    public async Task Delete(UserDetails userEdited)
    {
        try
        {
            ChangeLoading(true);

            bool dialogResult = await alertService.DisplayDialog(
                "Удаление пользователя",
                "Вы уверены что хотите удалить пользователя",
                "Да", "Нет");

            if (!dialogResult)
            {
                ChangeLoading(false);
                return;
            }

            APIResponse response = await DeleteByIdUser(userEdited);

            if (!response.Result)
            {
                await alertService.DisplayMessage(
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

                navigationManager.NavigateTo("/main/users_panel", false, true);

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

    public async Task Save(UserDetails userEdited)
    {
        try
        {
            ChangeLoading(true);

            if (userEdited.Id == 0)
            {
                APIResponse response = await AddUser(userEdited);

                if (!response.Result)
                {
                    await alertService.DisplayMessage(
                        "Ошибка!",
                        response.Message,
                        "OK");
                }
                else
                {
                    await alertService.DisplayMessage(
                        "Успех!",
                        "Пользователь успешно создан!",
                        "OK");

                    navigationManager.NavigateTo("/main/users_panel", false, true);

                }
            }
            else
            {
                APIResponse response = await PutUser(userEdited);

                if (!response.Result)
                {
                    await alertService.DisplayMessage(
                        "Ошибка при создание пользователя!",
                        response.Message,
                        "OK");
                }
                else
                {
                    await alertService.DisplayMessage(
                        "Успех!",
                        "Пользователь успешно обновлен!",
                        "OK");

                    navigationManager.NavigateTo("/main/users_panel", false, true);
                }
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

    public void NavigateBack()
        => navigationManager.NavigateTo("/main/users_panel", false, false);

    #endregion
}
