using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.Interfaces.ViewModels.StartUp;

public interface ILoginVM
{
    bool IsLoading { get; set; }
    string Login { get; set; }
    string Password { get; set; }   
    AuthenticationStateProvider AuthenticationProvider { get; set; }
    NavigationManager NavigationService { get; set; }
    Task InitilizedVMAsync();
    void InitilizedVM();
    Task LoginCompletly(string login, string password);
}
