namespace OperatorApp_Client.Interfaces.Services;

public interface IPickUpFileService
{
    Task<string> PickUpXLXSAsync(DateTime date);
    Task<string> PickUpMDBAsync();
}
