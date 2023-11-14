namespace KTKAdmin.Abstracts.Services;

public interface IPreferenceService
{
    string LoginPreference { get; set; }
    string PasswordPreference { get; set; }
    string FilePathMdbPreference { get; set; }
}
