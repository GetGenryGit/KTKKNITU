using Microsoft.AspNetCore.Components;
using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.Interfaces.ViewModels.Main.Admin;

public interface IUserEditVM
{
    bool IsLoading { get; set; }
    AdminPanelUserItem UserInf { get; set; }
    NavigationManager NavigationService { get; set; }
    Task InitilizedVMAsync();
    void InitilizedVM();
    Task Save(AdminPanelUserItem userEdited);
    Task Delete(AdminPanelUserItem userEdited);
}
