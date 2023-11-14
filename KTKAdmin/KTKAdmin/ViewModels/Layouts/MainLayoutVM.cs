using Blazored.LocalStorage;
using KTKAdmin.Abstracts.Services;
using KTKAdmin.Abstracts.ViewModels.Layouts;
using KTKAdmin.Services;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using System.ComponentModel;

namespace KTKAdmin.ViewModels.Layouts;

public class MainLayoutVM : BaseVM, IMainLayoutVM
{
    #region [Ctor]
    private ILocalStorageService localStorage { get; set; }
    private IDisplayAlertService alertService { get; set; }
    private IPreferenceService preferenceService { get; set; }
    private NavigationManager navigationManager { get; set; }
    private AuthenticationStateProvider authenticationStateProvider { get; set; } 

    public MainLayoutVM(ILocalStorageService LocalStorage, IDisplayAlertService AlertService,
        IPreferenceService PreferenceService, NavigationManager NavigationManager,
        AuthenticationStateProvider AuthenticationStateProvider)
    {
        localStorage = LocalStorage;
        alertService = AlertService;
        preferenceService = PreferenceService;
        navigationManager = NavigationManager;
        authenticationStateProvider = AuthenticationStateProvider;  
    }
    #endregion

    #region [Propeties]

    private const string darkTheme = "dark";
    private string themeState = string.Empty;
    public string ThemeState 
    { 
        get => themeState;
        set
        {
            themeState = value;
            PropertyChanged?.Invoke(this, new
                PropertyChangedEventArgs(nameof(ThemeState)));
        }
    }

    private const string closeNavBar = "close";
    private string navBarState = string.Empty;

    public event PropertyChangedEventHandler PropertyChanged;

    public string NavBarState 
    { 
        get => navBarState; 
        set
        {
            navBarState = value;
            PropertyChanged?.Invoke(this, new
                PropertyChangedEventArgs(nameof(NavBarState)));
        }
        
    }

    #endregion

    #region [MainMethods]
    public override void OnInitVM() { }
    public override async Task OnInitVMAsync() 
    {
        string themeTmp = await localStorage.GetItemAsStringAsync("theme");

        themeState = themeTmp == "dark"
            ? themeState = darkTheme
            : themeState = string.Empty; ;
    }
    public async Task ChangeThemeState()
    {
        if (ThemeState == darkTheme)
        {
            ThemeState = string.Empty;
            await localStorage.SetItemAsStringAsync("theme", "light");
        }
        else
        {
            ThemeState = darkTheme;
            await localStorage.SetItemAsStringAsync("theme", "dark");
        }
    }
    public void ChangeNavBarState()
        => NavBarState = NavBarState == closeNavBar
                ? string.Empty
                : closeNavBar;
    public async Task SignOut()
    {
        var isQuit = await alertService.DisplayDialog
               (
                    "Выйти к окну авторизации!",
                    "Вы уверены что хотите выйти к окну авторнизации?",
                    "Да", "Нет"
                );

        if (!isQuit)
            return;

        preferenceService.LoginPreference = string.Empty;
        preferenceService.PasswordPreference = string.Empty;

        var authenticationService = (AuthenticationService)authenticationStateProvider;
        await authenticationService.ActualizerAuthInf(null);

        navigationManager.NavigateTo("", true, true);
    }
    #endregion
}
