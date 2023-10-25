namespace OperatorApp_Client.Interfaces.Services;

public interface IPreferencesService
{
    string LoginPreference { get; set; }
    string PasswordPreference { get; set; }
    string FilePathMdbPreference { get; set; }
}
