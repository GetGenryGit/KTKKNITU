using KTKAdmin.Abstracts.Services;
using KTKAdmin.Constansts;

namespace KTKAdmin.Services;

public class PickUpFileService : IPickUpFileService
{
    #region [MainMethods]
    public async Task<string> PickUpXLXSAsync(DateTime date)
    {
        FileResult result = await FilePicker.PickAsync(new PickOptions
        {
            PickerTitle = $"Выберите файл {date.ToString("dd.MM.yyyy")}",
            FileTypes = PickUpFileConstants.MaskExcel
        });

        if (result == null)
            return null;

        if (!result.FileName.Contains(date.ToString("dd.MM.yyyy")))
        {
            await App.Current.MainPage.DisplayAlert("Некорректно выбран файл", "файл в название не содержит корректную дату", "ОК");

            return null;
        }

        return result.FullPath;
    }

    public async Task<string> PickUpMDBAsync()
    {
        FileResult result = await FilePicker.PickAsync(new PickOptions
        {
            PickerTitle = $"Выберите файл .mdb",
            FileTypes = PickUpFileConstants.MaskAccess
        });

        if (result == null)
            return null;

        return result.FullPath;
    }
    #endregion
}
