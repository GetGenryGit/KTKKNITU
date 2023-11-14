using KTKAdmin.Models;

namespace KTKAdmin.Abstracts.ViewModels.Main;

public interface IScheduleCollectiveItemVM : IBaseVM
{
    ScheduleItemObj SelectedItem { get; set; } 

    void NavigateBack();
}
