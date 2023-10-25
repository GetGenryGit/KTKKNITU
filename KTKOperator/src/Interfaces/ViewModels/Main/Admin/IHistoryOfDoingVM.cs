using OperatorApp_Client.MVVMS.Models;


namespace OperatorApp_Client.Interfaces.ViewModels.Main.Admin;

public interface IHistoryOfDoingVM
{
    bool IsLoading { get; set; }
    List<HistoryItem> HistoryList { get; set; }
    Task InitilizedVMAsync();
    void InitilizedVM();
    Task UpdateHistoryList();
}
