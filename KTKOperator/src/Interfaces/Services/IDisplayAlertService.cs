namespace OperatorApp_Client.Interfaces.Services;

public interface IDisplayAlertService
{
    Task DisplayMessage(string title,
    string text,
    string OkeyMessage);

    Task<bool> DisplayDialog(string title,
    string text,
    string trueCondition, string falseCondition);
}
