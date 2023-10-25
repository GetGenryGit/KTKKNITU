using OperatorApp_Client.Interfaces.Services;

namespace OperatorApp_Client.MVVMS.Services;

public class PickUpFileService : IPickUpFileService
{
    #region [MainMethods]
    public async Task<string> PickUpFileAsync(FilePickerFileType mask)
    {
        FileResult result = await FilePicker.PickAsync(new PickOptions
        {
            PickerTitle = "Выберите файл",
            FileTypes = mask
        });

        if (result == null)
            return null;

        return result.FullPath;
    }
    #endregion
}
