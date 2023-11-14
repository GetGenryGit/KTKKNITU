using KTKAdmin.Models;

namespace KTKAdmin.Abstracts.ViewModels.Main;

public interface IUsersPanelVM : IBaseVM
{
    #region [Properties]
    List<UserDetails> UsersList { get; set; }
    #endregion

    #region [MainMethods]
    Task RefreshUsersList();
    void EditUser(UserDetails userInf);
    void CreateUser();
    #endregion
}
