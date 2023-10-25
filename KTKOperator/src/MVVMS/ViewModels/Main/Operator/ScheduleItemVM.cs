using OperatorApp_Client.Interfaces.Services;
using OperatorApp_Client.Interfaces.ViewModels.Main.Operator;
using OperatorApp_Client.MVVMS.Models;
using OperatorApp_Client.MVVMS.Services;

namespace OperatorApp_Client.MVVMS.ViewModels.Main.Operator;

public class ScheduleItemVM : IScheduleItemVM
{
    #region [Contruction]
    private IDisplayAlertService displayAlertService;
    public ScheduleItemVM(IDisplayAlertService displayAlertService)
    {
        this.displayAlertService = displayAlertService;
    }
    #endregion

    #region [Properties]
    private ScheduleItemObj itemSchedule = new ScheduleItemObj();
    public ScheduleItemObj ItemSchedule 
    { 
        get => itemSchedule;
        set => itemSchedule = value;
    }

    private ScheduleItemObj item = new ScheduleItemObj();
    public ScheduleItemObj Item
    {
        get => item;
        set => item = value;
    }
    #endregion



}
