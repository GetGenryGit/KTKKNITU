namespace KTKAdmin.Abstracts.ViewModels.StartUp;

public interface ISignInVM : IBaseVM
{

    #region [Properties]
    string LoginInput { get; set; }
    string PasswordInput { get; set; }
    #endregion

    #region [MainMethods]
    Task SignIn();
    #endregion



}
