using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.Interfaces.ViewModels.Main.Operator;

public interface IHistoryOfScheduleVM
{
    bool IsLoading { get; set; }
    List<HistoryItem> HistoryList { get; set; }
    private void LoadingChange(bool state)
        => IsLoading = state;
    Task InitilizedVMAsync();
    void InitilizedVM();
    Task UpdateHistoryList();
}
