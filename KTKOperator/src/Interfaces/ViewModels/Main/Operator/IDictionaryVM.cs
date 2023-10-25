namespace OperatorApp_Client.Interfaces.ViewModels.Main.Operator;

public interface IDictionaryVM
{
    bool IsLoading { get; set; }
    string PathFull { get; set; }
    void ClearPath();
    Task InitilizedVMAsync();
    void InitilizedVM();
    Task SelectPath();
    Task SyncDictionary();
}
