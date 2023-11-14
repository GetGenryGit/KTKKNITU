using KTKAdmin.Abstracts.Services;
using KTKAdmin.Abstracts.ViewModels.Main;
using KTKAdmin.Constansts;
using KTKAdmin.Models;
using Microsoft.AspNetCore.Components;
using System.Text.Json;

namespace KTKAdmin.ViewModels.Main;

public class SchedulePublisherVM : BaseVM, ISchedulePublisherVM
{
    #region [Ctor]
    private IExcelService excelService { get; set; }
    private IHttpService httpService { get; set; }
    private IDisplayAlertService alertService { get; set; }
    private IPickUpFileService pickUpFileService { get; set; }
    private IScheduleCollectiveItemVM scheduleCollectiveItemVM { get; set; }
    private NavigationManager navigationManager { get; set; }
    public SchedulePublisherVM(IExcelService ExcelService, IHttpService HttpService, IDisplayAlertService AlertService,
        IPickUpFileService PickUpFileService, IScheduleCollectiveItemVM ScheduleCollectiveItemVM, NavigationManager NavigationManager)
    {
        excelService = ExcelService;
        httpService = HttpService;
        alertService = AlertService;
        pickUpFileService  = PickUpFileService;
        scheduleCollectiveItemVM = ScheduleCollectiveItemVM;
        navigationManager = NavigationManager;
    }
    #endregion

    #region [Properties]
    private DateTime selectedDate = DateTime.Today;
    public DateTime SelectedDate
    {
        get => selectedDate;
        set => selectedDate = value == DateTime.MinValue ? DateTime.Today : value;
    }
    public ScheduleGet ScheduleDetails { get; set; } = new();
    #endregion

    #region [SecondoryMethods]
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

    private async Task<APIResponse> SendNotification(string title, string body)
    {
        var postDataSchedule = new Dictionary<string, string>
        {
            /*{ "API_KEY", APIConstants.token },*/
                { "title",  title },
                { "body",  body }
            };

        return await httpService.POST(APIConstants.NotificationSend, postDataSchedule);
    }
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
    public override void OnInitVM() { }

    public override async Task OnInitVMAsync() { }

    public void ClearDataTable()
        => ScheduleDetails.scheduleObjList.ScheduleItems.Clear();

    public async Task RecieveDataFromExcel()
    {
        try
        {
            ChangeLoading(true);

            ScheduleDetails.scheduleObjList.ScheduleItems.Clear();

            var list = new ScheduleGet();

            string srcExcelFile = string.Empty;

            srcExcelFile = await pickUpFileService.PickUpXLXSAsync(SelectedDate);

            if (string.IsNullOrWhiteSpace(srcExcelFile))
            {
                ChangeLoading(false);
                return;
            }

            list = await excelService.GetDataExcel(srcExcelFile);

            ScheduleDetails = list;

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

    public void ShowSchedule(ScheduleItemObj item)
    {
        scheduleCollectiveItemVM.SelectedItem = item;

        navigationManager.NavigateTo("schedule_collective");
    }

    public async Task UploadDataTable()
    {
        try
        {
            ChangeLoading(true);

            if (ScheduleDetails.scheduleObjList.ScheduleItems.Count < 1)
            {
                bool result = await alertService.DisplayDialog(
                    "Удаление расписания",
                    $"Вы уверены что хотите сбросить расписание за {SelectedDate.ToString("dd.MM.yyyy")}, в будущем его нельзя будет вернуть!",
                     "Да", "Нет");

                if (!result)
                {
                    ChangeLoading(false);
                    return;
                }

                APIResponse response = await ClearSchedule(SelectedDate);

                if (response.Result)
                {
                    await alertService.DisplayMessage(
                        "Удаление расписания",
                        $"Расписание за {SelectedDate.ToString("dd.MM.yyyy")} успешно сброшено",
                         "OK");

                    APIResponse responseNotifyDelete = await SendNotification
                    (
                        "Изменения в расписание!",
                        $"Расписание за {SelectedDate.ToString("dd.MM.yyyy")} было сброшено!"
                    );

                    if (responseNotifyDelete.Result)
                    {
                        await alertService.DisplayMessage(
                            "Уведомление успешно отправлено",
                            $"{responseNotifyDelete.Message}",
                            "OK");
                    }
                    else
                    {
                        await alertService.DisplayMessage(
                            "Не удалось отправить уведомление пользователю",
                            $"{responseNotifyDelete.Message}",
                            "OK");
                    }
                }
                else
                {
                    await alertService.DisplayMessage(
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
                    await alertService.DisplayMessage(
                        "Удаление расписания",
                       $"Произошла ошибка при удаление расписания за {SelectedDate.ToString("yyyy-MM-dd")}: {responseClear.Message}",
                        "OK");

                    return;
                }

                APIResponse responseSending = await UploadSchedule(SelectedDate, ScheduleDetails);

                if (responseSending.Result)
                {
                    await alertService.DisplayMessage(
                        "Публикация расписания",
                       $"Расписание за {SelectedDate.ToString("dd.MM.yyyy")} успешно опубликованно",
                        "OK");

                    APIResponse responseNotifyPublished = await SendNotification
                    (
                        "Опубликованно расписание!",
                        $"Расписание опубликованно за {SelectedDate.ToString("dd.MM.yyyy")}!"
                    );

                    if (responseNotifyPublished.Result)
                    {
                        await alertService.DisplayMessage(
                            "Уведомление успешно отправлено",
                            $"{responseNotifyPublished.Message}",
                            "OK");
                    }
                    else
                    {
                        await alertService.DisplayMessage(
                            "Не удалось отправить уведомление пользователю",
                            $"{responseNotifyPublished.Message}",
                            "OK");
                    }
                }
                else
                {
                    await alertService.DisplayMessage(
                        "Публикация расписания",
                       $"Произошла ошибка: {responseSending.Message}",
                        "OK");
                }
            }

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
