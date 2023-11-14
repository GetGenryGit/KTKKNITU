using KTKAdmin.Models;

namespace KTKAdmin.Abstracts.ViewModels.Main;

public interface ISchedulePublisherVM : IBaseVM
{
    #region [Properties]
    DateTime SelectedDate { get; set; } 
    ScheduleGet ScheduleDetails { get; set; }
    #endregion

    #region [MainMethods]
    void ShowSchedule(ScheduleItemObj item);
    Task RecieveDataFromExcel();
    void ClearDataTable();
    Task UploadDataTable();
    #endregion
}
