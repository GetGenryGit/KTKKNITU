namespace KTKAdmin.Abstracts.ViewModels;

public interface IBaseVM
{
    bool IsBusy { get; set; }
    string Title { get; set; }

    void ChangeLoading(bool state);

    void OnInitVM();
    Task OnInitVMAsync();
}
