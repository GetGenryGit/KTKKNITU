using KTKAdmin.Abstracts.ViewModels.Main;
using KTKAdmin.Models;
using Microsoft.AspNetCore.Components;

namespace KTKAdmin.ViewModels.Main;

public class ScheduleCollectiveItemVM : BaseVM, IScheduleCollectiveItemVM
{
    #region [Ctor]
    private NavigationManager navigationManager { get; set; }
    public ScheduleCollectiveItemVM(NavigationManager NavigationManager)
    {
        navigationManager = NavigationManager;  
    }
    #endregion

    #region [Properties]

    private ScheduleItemObj selectedItem = new ScheduleItemObj();
    public ScheduleItemObj SelectedItem 
    { 
        get => selectedItem; 
        set => selectedItem = value; 
    }

    #endregion

    #region [SecondoryMethods]

    #endregion

    #region [MainMethods]
    public override void OnInitVM() { }

    public override async Task OnInitVMAsync() { }

    public void NavigateBack()
        => navigationManager.NavigateTo("/main/schedules", false, false);
    #endregion
}
