using Microsoft.AspNetCore.Components;
using OperatorApp_Client.Constants;
using OperatorApp_Client.Interfaces.Services;
using OperatorApp_Client.Interfaces.ViewModels.Main.Operator;
using OperatorApp_Client.MVVMS.Models;
using System.Text.Json;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace OperatorApp_Client.MVVMS.ViewModels.Main.Operator;

public class ScheduleVM : IScheduleVM
{
    #region [Constructors]
    private IDisplayAlertService displayAlertService;
    private IExcelService excelService;
    private IHttpService httpService;
    private IPickUpFileService pickUpFileService;
    private IScheduleItemVM scheduleItemVM;
    public NavigationManager navigationService { get; set; }
    public ScheduleVM(IDisplayAlertService displayAlertService, IHttpService httpService,
        IExcelService excelService, IPickUpFileService pickUpFileService, IScheduleItemVM scheduleItemVM)
    {
        this.displayAlertService = displayAlertService;
        this.httpService = httpService;
        this.excelService = excelService;
        this.pickUpFileService = pickUpFileService;
        this.scheduleItemVM = scheduleItemVM;
    }
    #endregion

    #region [Properties]
    private bool isLoading;
    public bool IsLoading
    {
        get => isLoading;
        set => isLoading = value;
    }

    private DateTime selectedDate = DateTime.Now;
    public DateTime SelectedDate 
    {
        get
        {
            return selectedDate;
        }
        set
        {
            selectedDate = value;
        }
    }

    private ScheduleGet scheduleList = new ScheduleGet();
    public ScheduleGet ScheduleList 
    { 
        get => scheduleList; 
        set => scheduleList = value; 
    }
    public string test { get; set; }
    #endregion

    #region [SecondoryMethods]
    private void LoadingChange(bool state)
        => IsLoading = state;
    private async Task<APIResponse> ClearSchedule(DateTime date)
    {
        var postDataClearSchedule1 = new Dictionary<string, string>
        {
              /*{ "API_KEY", APIConstants.token },*/
              { "date",  date.ToString("yyyy-MM-dd") }
        };

        return await httpService.POST(APIConstants.ScheduleDelete, postDataClearSchedule1);

    } // API CALL Clear Schedule BY DATE
    private async Task<APIResponse> UploadSchedule(DateTime date, ScheduleGet schedule)
    {
        string sendListJson = ConvertForSending(schedule);

        var postDataSchedule = new Dictionary<string, string>
        {
            /*{ "API_KEY", APIConstants.token },*/
                { "date",  date.ToString("yyyy-MM-dd") },
                { "data",  sendListJson }
            };

        return await httpService.POST(APIConstants.ScheduleAdd, postDataSchedule);

    } // API CALL Upload Schedule BY DATE
    private string ConvertForSending(ScheduleGet schedule)
    {
        var sendList = new List<ScheduleItem>();

        foreach (var group in schedule.scheduleObjList.ScheduleItems)
        {
            foreach (var lesson in group.LessonItems)
            {
                foreach (var item in lesson.Items)
                {
                    var convertedGroup = new ScheduleItem
                    {
                        ClassIndex = lesson.Index,
                        Collective = group.Title,
                        Subject = item.Title1,
                        Classroom = item.Title2,
                        Teacher = item.Title3,
                        SubGroup = item.SubGroup,
                    };
                    sendList.Add(convertedGroup);
                }

            }
        }

        schedule.scheduleList = sendList;
        schedule.scheduleObjList = new ScheduleObj();

        return JsonSerializer.Serialize(schedule);
    } // Convert in correct object and serilized in JSON
    #endregion

    #region [MainMethods]
    public Task InitilizedVMAsync()
    {
        throw new NotImplementedException();
    }

    public void InitilizedVM()
    {
        throw new NotImplementedException();
    }
    public void ClearDataTable()
        => ScheduleList.scheduleObjList.ScheduleItems.Clear();

    public async Task RecieveDataFromExcel()
    {
        try
        {
            LoadingChange(true);

            var list = new ScheduleGet();

            string srcExcelFile = string.Empty;

            srcExcelFile = await pickUpFileService.PickUpXLXSAsync(SelectedDate);

            if (string.IsNullOrWhiteSpace(srcExcelFile))
            {
                LoadingChange(false);
                return;
            }

            list = await excelService.GetDataExcel(srcExcelFile);

            ScheduleList = list;

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

    public async Task UploadDataTable()
    {
        try
        {
            LoadingChange(true);

            if (ScheduleList.scheduleObjList.ScheduleItems.Count < 1)
            {
                bool result = await displayAlertService.DisplayDialog(
                    "Удаление расписания",
                    $"Вы уверены что хотите сбросить расписание за {SelectedDate.ToString("dd.MM.yyyy")}",
                     "Да", "Нет");

                if (!result)
                {
                    LoadingChange(false);
                    return;
                }

                APIResponse response = await ClearSchedule(SelectedDate);

                if (response.Result)
                {
                    await displayAlertService.DisplayMessage(
                        "Удаление расписания",
                        $"Расписание за {SelectedDate.ToString("dd.MM.yyyy")} успешно сброшено",
                         "OK");
                }
                else
                {
                    await displayAlertService.DisplayMessage(
                        "Удаление расписания",
                        $"Произошла ошибка: ${response.Message}",
                        "OK");
                }
            }
            else
            {
                APIResponse responseClear = await ClearSchedule(SelectedDate);

                if (!responseClear.Result)
                {
                    await displayAlertService.DisplayMessage(
                        "Удаление расписания",
                       $"Произошла ошибка при удаление расписания за {SelectedDate.ToString("yyyy-MM-dd")}: {responseClear.Message}",
                        "OK");

                    return;
                }

                APIResponse responseSending = await UploadSchedule(SelectedDate, ScheduleList);

                test = JsonSerializer.Serialize(ScheduleList);

                if (responseSending.Result)
                {
                    await displayAlertService.DisplayMessage(
                        "Публикация расписания",
                       $"Расписание за {SelectedDate.ToString("dd.MM.yyyy")} успешно опубликованно",
                        "OK");
                }
                else
                {
                    await displayAlertService.DisplayMessage(
                        "Публикация расписания",
                       $"Произошла ошибка: {responseSending.Message}",
                        "OK");
                }
            }

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

    public void ShowSchedule(ScheduleItemObj item)
    {
        scheduleItemVM.Item = item;

        navigationService.NavigateTo("/schedule/schedule_item");
    }
    #endregion
}
