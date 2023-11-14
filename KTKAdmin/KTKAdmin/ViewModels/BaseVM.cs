using KTKAdmin.Abstracts.ViewModels;

namespace KTKAdmin.ViewModels;

public abstract class BaseVM : IBaseVM
{
    private bool isBusy;
    public bool IsBusy 
    { 
        get => isBusy; 
        set => isBusy = value; 
    }

    private string title = "Empty title";
    public string Title 
    { 
        get => title;
        set => title = value;
    }

    public void ChangeLoading(bool state)
        => IsBusy = state;

    public abstract void OnInitVM();

    public abstract Task OnInitVMAsync();
}
