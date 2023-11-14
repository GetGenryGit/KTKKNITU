using KTKAdmin.Abstracts.Services;
using KTKAdmin.Abstracts.ViewModels.Main;
using KTKAdmin.Constansts;
using KTKAdmin.Models;
using Microsoft.AspNetCore.Components;
using System.Text.Json;

namespace KTKAdmin.ViewModels.Main;

public class ScheduleLogsVM : BaseVM, IScheduleLogsVM
{
    #region [Ctor]
    private IHttpService httpService { get; set; }
    private IDisplayAlertService alertService { get; set; }
    public ScheduleLogsVM(IHttpService HttpService, IDisplayAlertService AlertService)
    {
        httpService = HttpService;
        alertService = AlertService;
    }
    #endregion

    #region [Properties]
    private List<HistoryItem> historyList = new();
    public List<HistoryItem> HistoryList 
    { 
        get => historyList; 
        set => historyList = value; 
    }

    #endregion

    #region [SecondoryMethods]
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

    public override void OnInitVM() { }

    public override async Task OnInitVMAsync()
        => await UpdateLogs();
   
    public async Task UpdateLogs()
    {
        try
        {
            ChangeLoading(true);

            APIResponse response = await GetHistoryOperator();

            if (!response.Result)
            {
                await alertService.DisplayMessage(
                    "Ошибка",
                    response.Message,
                    "OK");

                ChangeLoading(false);

                return;
            }

            var historyList = JsonSerializer.Deserialize<List<HistoryItem>>(response.Obj.ToString());
            historyList.Reverse();

            HistoryList = historyList;

            ChangeLoading(false);
        }
        catch (Exception ex)
        {
            ChangeLoading(false);

            await alertService.DisplayMessage(
                "Исключение",
                ex.Message,
                "ОК");
        }
    }
    #endregion
}
