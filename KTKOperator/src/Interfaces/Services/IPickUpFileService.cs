namespace OperatorApp_Client.Interfaces.Services;

public interface IPickUpFileService
{
    Task<string> PickUpFileAsync(FilePickerFileType mask);
}
