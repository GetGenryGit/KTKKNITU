using OperatorApp_Client.Interfaces.Services;

namespace OperatorApp_Client.MVVMS.Services;

public class PreferencesService : IPreferencesService
{
    private string loginPreference;
    public string LoginPreference 
    {
        get => Preferences.Get(nameof(loginPreference), string.Empty);
        set => Preferences.Set(nameof(loginPreference), value);
    }

    private string passwordPreference;
    public string PasswordPreference 
    {
        get => Preferences.Get(nameof(passwordPreference), string.Empty);
        set => Preferences.Set(nameof(passwordPreference), value);
    }

    private string filePathMdbPreference;
    public string FilePathMdbPreference 
    {
        get => Preferences.Get(nameof(filePathMdbPreference), string.Empty);
        set => Preferences.Set(nameof(filePathMdbPreference), value);
    }
}
