namespace KTKAdmin.Abstracts.Services;

public interface IPickUpFileService
{
    Task<string> PickUpXLXSAsync(DateTime date);
    Task<string> PickUpMDBAsync();
}
