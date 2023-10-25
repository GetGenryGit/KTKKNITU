using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.Interfaces.ViewModels.Main.Operator;

public interface IScheduleItemVM
{
    ScheduleItemObj ItemSchedule { get; set; }
    ScheduleItemObj Item { get; set; }
}
