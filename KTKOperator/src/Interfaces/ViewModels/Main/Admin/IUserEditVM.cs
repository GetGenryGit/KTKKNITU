using Microsoft.AspNetCore.Components;
using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.Interfaces.ViewModels.Main.Admin;

public interface IUserEditVM
{
    bool IsLoading { get; set; }
    UserDetails UserInf { get; set; }
    NavigationManager NavigationService { get; set; }
    Task InitilizedVMAsync();
    void InitilizedVM();
    Task Save(UserDetails userEdited);
    Task Delete(UserDetails userEdited);
}
