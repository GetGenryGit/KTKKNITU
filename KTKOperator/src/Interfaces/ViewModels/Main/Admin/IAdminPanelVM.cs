using Microsoft.AspNetCore.Components;
using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.Interfaces.ViewModels.Main.Admin;

public interface IAdminPanelVM
{
    NavigationManager NavigationService { get; set; }
    bool IsLoading { get; set; }
    List<AdminPanelUserItem> UsersList { get; set; }
    Task InitilizedVMAsync();
    void InitilizedVM();
    Task UpdateUserList();
    Task CreateOrEdit(AdminPanelUserItem userInf = null);
}
