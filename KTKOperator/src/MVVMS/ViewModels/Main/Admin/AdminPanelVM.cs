using Microsoft.AspNetCore.Components;
using OperatorApp_Client.Constants;
using OperatorApp_Client.Interfaces.Services;
using OperatorApp_Client.Interfaces.ViewModels.Main.Admin;
using OperatorApp_Client.MVVMS.Models;
using System.Text.Json;

namespace OperatorApp_Client.MVVMS.ViewModels.Main.Admin;

public class AdminPanelVM : IAdminPanelVM
{
    #region [Constructors]
    private IDisplayAlertService displayAlertService;
    private IUserEditVM userEditVM;
    private IHttpService httpService;
    public NavigationManager NavigationService { get; set; }
    public AdminPanelVM(IDisplayAlertService displayAlertService,
        IUserEditVM userEditVM, IHttpService httpService)
    {
        this.displayAlertService = displayAlertService;
        this.userEditVM = userEditVM;
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

    private List<UserDetails> usersList = new List<UserDetails>();
    public List<UserDetails> UsersList
    {
        get => usersList;
        set => usersList = value;
    }
    #endregion

    #region [SecondoryMethods]
    private void LoadingChange(bool state)
        => IsLoading = state;

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
    public async Task InitilizedVMAsync()
        => await UpdateUserList();

    public void InitilizedVM()
    {
        throw new NotImplementedException();
    }
    public async Task CreateOrEdit(UserDetails userInf)
    {
        try
        {
            if (userInf != null)
            {
                userEditVM.UserInf.Id = userInf.Id;
                userEditVM.UserInf.Login = userInf.Login;
                userEditVM.UserInf.Password = userInf.Password;
                userEditVM.UserInf.Role = userInf.Role;
            }
            else
            {
                userEditVM.UserInf.Id = 0;
                userEditVM.UserInf.Login = string.Empty;
                userEditVM.UserInf.Password = string.Empty;

                userEditVM.UserInf.Role = "Выберите привелегию";
            }

            NavigationService.NavigateTo($"/admin_panel/user_edit");
        }
        catch (Exception ex)
        {
            await displayAlertService.DisplayMessage(
                "Исключение",
                ex.Message,
                "ОК");
        }
    }

    public async Task UpdateUserList()
    {
        try
        {
            LoadingChange(true);

            APIResponse response = await GetAllUsers();

            if (!response.Result)
            {
                await displayAlertService.DisplayMessage(
                    "Ошибка",
                    response.Message,
                    "OK");

                LoadingChange(false);

                return;
            }

            var adminPanelUserItems = JsonSerializer.Deserialize<List<UserDetails>>(response.Obj.ToString());
            adminPanelUserItems.Reverse();

            UsersList = adminPanelUserItems;

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
