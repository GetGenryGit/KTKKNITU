using KTKAdmin.Abstracts.Services;
using KTKAdmin.Abstracts.ViewModels.Main;
using KTKAdmin.Constansts;
using KTKAdmin.Models;
using System.Text.Json;

namespace KTKAdmin.ViewModels.Main;

public class DictionariesVM : BaseVM, IDictionariesVM
{
    #region [Ctor]
    private IAccessService accessService { get; set; }
    private IHttpService httpService { get; set; }
    private IPickUpFileService pickUpFileService { get; set; }
    private IPreferenceService preferenceService { get; set; }
    private IDisplayAlertService alertService { get; set; }

    public DictionariesVM(IAccessService AccessService, IHttpService HttpService,
        IPickUpFileService PickUpFileService, IPreferenceService PreferenceService, IDisplayAlertService AlertService)
    {
        accessService = AccessService;
        httpService = HttpService;
        pickUpFileService = PickUpFileService;
        preferenceService = PreferenceService;
        alertService = AlertService;
    }
    #endregion

    #region [Properties]
    private string pathFull;
    public string PathFull 
    {
        get => pathFull;
        set => pathFull = value;
    }

    private List<DictionaryItem> collectivesList = new();
    public List<DictionaryItem> CollectivesList 
    { 
        get => collectivesList; 
        set => collectivesList = value;
    }

    private List<DictionaryItem> teachersList = new();
    public List<DictionaryItem> TeachersList 
    { 
        get => teachersList; 
        set => teachersList = value; 
    }

    private List<DictionaryItem> subjectsList = new();
    public List<DictionaryItem> SubjectsList 
    {
        get => subjectsList; 
        set => subjectsList = value; 
    }

    private List<DictionaryItem> classroomsList = new();
    public List<DictionaryItem> ClassroomsList 
    { 
        get => classroomsList; 
        set => classroomsList = value;
    }


    #endregion

    #region [SecondoryMethods]
    private async Task<APIResponse> SyncDictionaryItem(string dictionaryPathUrl, List<object> list) // API CALL Sync Dictionary Item
    {
        Dictionary<string, string> postData;

        string listJson = JsonSerializer.Serialize(list);
        postData = new Dictionary<string, string>
        {
/*            { "API_KEY", APIConstants.token },
*/            { "list", listJson }
        };

        return await httpService.POST(dictionaryPathUrl, postData);
    }
    private async Task<bool> SyncAllDictionary() // Sync ALl Dictionary Lists
    {
        string connString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={PathFull}";

        var groupList = new List<object>();
        var teacherList = new List<object>();
        var subjectList = new List<object>();
        var classroomList = new List<object>();

        await Task.Run(() =>
        {
            groupList = accessService.ReadGroups(connString);
            teacherList = accessService.ReadTeachers(connString);
            subjectList = accessService.ReadSubjects(connString);
            classroomList = accessService.ReadClassroom(connString);
        });

        APIResponse responseGroup = await SyncDictionaryItem(APIConstants.CollectivesAdd, groupList);
        APIResponse responseTeacher = await SyncDictionaryItem(APIConstants.TeachersAdd, teacherList);
        APIResponse responseSubject = await SyncDictionaryItem(APIConstants.SubjectsAdd, subjectList);
        APIResponse responseClassroom = await SyncDictionaryItem(APIConstants.ClassroomAdd, classroomList);

        if (!responseGroup.Result)
            await Application.Current.MainPage.DisplayAlert(
                "Ошибка!",
                $"Ошибка при обновление справочника группы\nЛоги: {responseGroup.Message}",
                "OK");

        if (!responseTeacher.Result)
            await Application.Current.MainPage.DisplayAlert(
                "Ошибка!",
                $"Ошибка при обновление справочника учителя\nЛоги: {responseTeacher.Message}",
                "OK");

        if (!responseSubject.Result)
            await Application.Current.MainPage.DisplayAlert(
                "Ошибка!",
                $"Ошибка при обновление справочника дисциплины\nЛоги: {responseSubject.Message}",
                "OK");

        if (!responseClassroom.Result)
            await Application.Current.MainPage.DisplayAlert(
                "Ошибка!",
                $"Ошибка при обновление справочника кабинеты\nЛоги: {responseClassroom.Message}",
                "OK");

        var resultList = new List<bool>
        {
            responseGroup.Result,
            responseTeacher.Result,
            responseSubject.Result,
            responseClassroom.Result,
        }; // result List

        return resultList.Contains(false);
    }
    private async Task GetInfoAboutDictiories()
    {
        APIResponse responseCollectives = await httpService.GET(APIConstants.CollectivesGetAll);
        APIResponse responseTeachers = await httpService.GET(APIConstants.TeachersGetAll);
        APIResponse responseClassrooms = await httpService.GET(APIConstants.ClassroomGetAll);
        APIResponse responseSubjects = await httpService.GET(APIConstants.SubjectsGetAll);

        if (responseCollectives.Result)
            CollectivesList = JsonSerializer.Deserialize<List<DictionaryItem>>(responseCollectives.Obj.ToString());
        else
            await alertService.DisplayMessage("Ошибка", responseCollectives.Message, "ОК");

        if (responseTeachers.Result)
            TeachersList = JsonSerializer.Deserialize<List<DictionaryItem>>(responseTeachers.Obj.ToString());
        else
            await alertService.DisplayMessage("Ошибка", responseTeachers.Message, "ОК");

        if (responseSubjects.Result)
            SubjectsList = JsonSerializer.Deserialize<List<DictionaryItem>>(responseSubjects.Obj.ToString());
        else
            await alertService.DisplayMessage("Ошибка", responseClassrooms.Message, "ОК");

        if (responseClassrooms.Result)
            ClassroomsList = JsonSerializer.Deserialize<List<DictionaryItem>>(responseClassrooms.Obj.ToString());
        else
            await alertService.DisplayMessage("Ошибка", responseSubjects.Message, "ОК");
    }
    #endregion

    #region [MainMethods]
    public override void OnInitVM() { }

    public override async Task OnInitVMAsync()
    {
        try
        {
            ChangeLoading(true);

            if (!string.IsNullOrWhiteSpace(preferenceService.FilePathMdbPreference))
                PathFull = preferenceService.FilePathMdbPreference;
            else
                PathFull = string.Empty;

            await GetInfoAboutDictiories();

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

    public async Task SelectPath()
    {
        PathFull = await pickUpFileService.PickUpMDBAsync(); // Select File Access .mdb Button

        if (!string.IsNullOrWhiteSpace(PathFull))
            preferenceService.FilePathMdbPreference = PathFull;
        else
            preferenceService.FilePathMdbPreference = string.Empty;
    }

    public async Task SyncDictionary()
    {
        try
        {
            // is file selected
            if (string.IsNullOrWhiteSpace(PathFull))
            {
                await alertService.DisplayMessage(
                    "Ошибка",
                    "Путь к базе данных Access не выбран",
                    "OK");
                return;
            }

            // is path correct
            if (!File.Exists(PathFull))
            {
                await alertService.DisplayMessage(
                    "Ошибка",
                    "По выбранному пути файла Access не существует",
                    "OK");
                return;
            }

            ChangeLoading(true);

            bool isSyncHaveErrors = await SyncAllDictionary();

            if (isSyncHaveErrors)
            {
                await alertService.DisplayMessage(
                    "Ошибка!",
                    "Ошибка при загрузке справочников, некоторые справочники загруженны некоректно",
                    "OK");
            }
            else
            {

                await OnInitVMAsync();

                await alertService.DisplayMessage(
                    "Синхронизация справочников",
                    "Все справочники успешно синхронизированны",
                    "OK");
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
