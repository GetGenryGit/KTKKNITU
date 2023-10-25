using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.Interfaces.ViewModels.StartUp;

public interface ILoginVM
{
    bool IsLoading { get; set; }
    User UserAuth { get; set; }
    AuthenticationStateProvider AuthenticationProvider { get; set; }
    NavigationManager NavigationService { get; set; }
    Task InitilizedVMAsync();
    void InitilizedVM();
    Task Login(User userAuthentication);
}
