using KTKAdmin.Abstracts.Services;
using KTKAdmin.Abstracts.ViewModels.Main;
using KTKAdmin.Constansts;
using KTKAdmin.Models;
using Microsoft.AspNetCore.Components;
using System.Text.Json;

namespace KTKAdmin.ViewModels.Main;

public class UsersPanelVM : BaseVM, IUsersPanelVM
{
    #region [Ctor]
    private IDisplayAlertService alertService { get; set; }
    private IHttpService httpService { get; set; }
    private IUserFormVM userFormVM { get; set; }
    private NavigationManager navigationManager { get; set; }
    public UsersPanelVM(IDisplayAlertService AlertService, IHttpService HttpService,
        NavigationManager NavigationManager, IUserFormVM UserFormVM)
    {
        alertService = AlertService;
        httpService = HttpService;
        navigationManager = NavigationManager;
        userFormVM = UserFormVM;
    }
    #endregion

    #region [Properties]
    private List<UserDetails> userList = new();
    public List<UserDetails> UsersList 
    { 
        get => userList; 
        set => userList = value; 
    }

    #endregion

    #region [SecondoryMethods]
    private async Task<APIResponse> GetAllUsers()
    {
        /*var getAllUsersPost = new Dictionary<string, string>
            {
                { "API_KEY", APIConstants.token }
            };*/

        return await httpService.GET(APIConstants.GetAllUsers);
    }
    #endregion

    #region [MainMethods]
    public override void OnInitVM() { }

    public override async Task OnInitVMAsync()
        => await RefreshUsersList();

    public async Task RefreshUsersList()
    {
        try
        {
            ChangeLoading(true);

            APIResponse response = await GetAllUsers();

            if (!response.Result)
            {
                await alertService.DisplayMessage(
                    "Ошибка",
                    response.Message,
                    "OK");

                ChangeLoading(false);

                return;
            }

            var adminPanelUserItems = JsonSerializer.Deserialize<List<UserDetails>>(response.Obj.ToString());
            adminPanelUserItems.Reverse();

            UsersList = adminPanelUserItems;

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

    public void EditUser(UserDetails userInf)
    {
        userFormVM.UserInf.Id = userInf.Id;
        userFormVM.UserInf.Login = userInf.Login;
        userFormVM.UserInf.Password = userInf.Password;

        userFormVM.UserInf.Role = userInf.Role;

        navigationManager.NavigateTo($"/user_form/Редактирование пользователя {userInf.Login}");
    }

    public void CreateUser()
    {
        userFormVM.UserInf.Id = 0;
        userFormVM.UserInf.Login = string.Empty;
        userFormVM.UserInf.Password = string.Empty;

        userFormVM.UserInf.Role = "Выберите привелегию";

        navigationManager.NavigateTo("/user_form/Создание пользователя");
    }
    #endregion
}
