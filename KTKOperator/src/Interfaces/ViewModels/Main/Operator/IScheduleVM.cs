using Microsoft.AspNetCore.Components;
using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.Interfaces.ViewModels.Main.Operator;

public interface IScheduleVM
{
    NavigationManager navigationService { get; set; }
    bool IsLoading { get; set; }
    string test { get; set; }
    DateTime SelectedDate { get; set; }
    ScheduleGet ScheduleList { get; set; }
    private void LoadingChange(bool state)
        => IsLoading = state;
    Task InitilizedVMAsync();
    void InitilizedVM();
    void ShowSchedule(ScheduleItemObj item);
    Task RecieveDataFromExcel();
    void ClearDataTable();
    Task UploadDataTable();
}
