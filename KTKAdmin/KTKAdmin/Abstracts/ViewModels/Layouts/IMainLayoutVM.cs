using System.ComponentModel;

namespace KTKAdmin.Abstracts.ViewModels.Layouts;

public interface IMainLayoutVM : IBaseVM, INotifyPropertyChanged
{
    #region [Properties]
    string ThemeState { get; set; }

    string NavBarState { get; set; }
    #endregion

    #region [MainMethods]
    Task ChangeThemeState();
    void ChangeNavBarState();
    Task SignOut();
    #endregion

}
