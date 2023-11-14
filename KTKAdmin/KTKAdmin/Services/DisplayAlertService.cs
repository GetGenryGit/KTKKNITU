using KTKAdmin.Abstracts.Services;

namespace KTKAdmin.Services;

public class DisplayAlertService : IDisplayAlertService
{
    public async Task<bool> DisplayDialog(
    string title,
    string text,
    string trueCondition, string falseCondition)
        => await Application.Current.MainPage.DisplayAlert(
            title, text, trueCondition, falseCondition);

    public Task DisplayMessage(
    string title,
    string text,
    string OkeyMessage)
        => Application.Current.MainPage.DisplayAlert(
            title, text, OkeyMessage);
}
