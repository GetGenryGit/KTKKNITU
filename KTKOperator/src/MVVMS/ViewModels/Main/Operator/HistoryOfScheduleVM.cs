using OperatorApp_Client.Constants;
using OperatorApp_Client.Interfaces.Services;
using OperatorApp_Client.Interfaces.ViewModels.Main.Operator;
using OperatorApp_Client.MVVMS.Models;
using System.Text.Json;

namespace OperatorApp_Client.MVVMS.ViewModels.Main.Operator;

public class HistoryOfScheduleVM : IHistoryOfScheduleVM
{

    #region [Constructors]
    private IDisplayAlertService displayAlertService;
    private IHttpService httpService;
    public HistoryOfScheduleVM(IDisplayAlertService displayAlertService, IHttpService httpService)
    {
        this.displayAlertService = displayAlertService;
        this.httpService = httpService;

    }
    #endregion

    #region [Properties]
    private bool isLoading;
    public bool IsLoading
    {
        get => isLoading;
        set => isLoading = value;
    }

    private List<HistoryItem> historyList = new List<HistoryItem>();
    public List<HistoryItem> HistoryList
    {
        get => historyList;
        set => historyList = value;
    }
    #endregion

    #region [SecondoryMethods]
    private void LoadingChange(bool state)
        => IsLoading = state;
    private async Task<APIResponse> GetHistoryOperator()
    {
        /*var getAllUsersPost = new Dictionary<string, string>
        {
                { "API_KEY", APIConstants.token }
        };*/

        return await httpService.GET(APIConstants.GetLogs + "?role=О.Р.");
    }
    #endregion

    #region [MainMethods]
    public async Task InitilizedVMAsync()
    {
        await UpdateHistoryList();
    }
    public void InitilizedVM()
    {
        throw new NotImplementedException();
    }
    public async Task UpdateHistoryList()
    {
        try
        {
            LoadingChange(true);

            APIResponse response = await GetHistoryOperator();

            if (!response.Result)
            {
                await displayAlertService.DisplayMessage(
                    "Ошибка",
                    response.Message,
                    "OK");

                LoadingChange(false);

                return;
            }

            var historyList = JsonSerializer.Deserialize<List<HistoryItem>>(response.Obj.ToString());
            historyList.Reverse();

            HistoryList = historyList;

            LoadingChange(false);
        }
        catch (Exception ex)
        {
            LoadingChange(false);

            await displayAlertService.DisplayMessage(
                "Исключение",
                ex.Message,
                "ОК");
        }
    }
    #endregion

}
