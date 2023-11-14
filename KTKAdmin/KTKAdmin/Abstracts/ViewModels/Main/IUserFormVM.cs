using KTKAdmin.Models;

namespace KTKAdmin.Abstracts.ViewModels.Main;

public interface IUserFormVM : IBaseVM
{
    #region [Properties]
    UserDetails UserInf { get; set; }
    #endregion

    #region [MainMethods]
    void NavigateBack();
    Task Delete(UserDetails userEdited);
    Task Save(UserDetails userEdited);

    #endregion
}
