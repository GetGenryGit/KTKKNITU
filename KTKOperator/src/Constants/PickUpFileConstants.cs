namespace OperatorApp_Client.Constants;

public class PickUpFileConstants
{
    static private FilePickerFileType maskExcel = new FilePickerFileType(new Dictionary<DevicePlatform, IEnumerable<string>>
{
    { DevicePlatform.iOS, new[] { ".xlsx" } }, // UTType values
    { DevicePlatform.Android, new[] { ".xlsx" } }, // MIME type
    { DevicePlatform.WinUI, new[] { ".xlsx" } }, // file extension
    { DevicePlatform.Tizen, new[] { ".xlsx" } },
    { DevicePlatform.macOS, new[] { ".xlsx" } }, // UTType values
});
    static public FilePickerFileType MaskExcel => maskExcel;

    static private FilePickerFileType maskAccess = new FilePickerFileType(new Dictionary<DevicePlatform, IEnumerable<string>>
{
    { DevicePlatform.iOS, new[] { ".mdb" } }, // UTType values
    { DevicePlatform.Android, new[] { ".mdb" } }, // MIME type
    { DevicePlatform.WinUI, new[] { ".mdb" } }, // file extension
    { DevicePlatform.Tizen, new[] { ".mdb" } },
    { DevicePlatform.macOS, new[] { ".mdb" } }, // UTType values
});
    static public FilePickerFileType MaskAccess => maskAccess;
}
