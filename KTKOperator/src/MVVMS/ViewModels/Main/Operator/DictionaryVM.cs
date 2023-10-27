using OperatorApp_Client.Constants;
using OperatorApp_Client.Interfaces.Services;
using OperatorApp_Client.Interfaces.ViewModels.Main.Operator;
using OperatorApp_Client.MVVMS.Models;
using System.Text.Json;

namespace OperatorApp_Client.MVVMS.ViewModels.Main.Operator;

public class DictionaryVM : IDictionaryVM
{
    #region [Constructors]
    private IDisplayAlertService displayAlertService;
    private IAccessService accessService;
    private IHttpService httpService;
    private IPickUpFileService pickUpFileService;
    private IPreferencesService preferencesService;
    public DictionaryVM(IDisplayAlertService displayAlertService,
        IAccessService accessService, IHttpService httpService,
        IPickUpFileService pickUpFileService, IPreferencesService preferencesService)
    {
        this.displayAlertService = displayAlertService;
        this.accessService = accessService;
        this.httpService = httpService;
        this.pickUpFileService = pickUpFileService;
        this.preferencesService = preferencesService;
    }
    #endregion

    #region [Properties]
    private bool isLoading;
    public bool IsLoading 
    { 
        get => isLoading; 
        set => isLoading = value; 
    }

    private string pathFull;
    public string PathFull 
    { 
        get => pathFull;
        set => pathFull = value;
    }
    #endregion

    #region [SecondoryMethods]
    private void LoadingChange(bool state)
        => IsLoading = state;
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

        APIResponse responseGroup = await SyncDictionaryItem(APIConstants.GroupsAdd, groupList);
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
    #endregion

    #region [MainMethods]
    public async Task InitilizedVMAsync()
    {
        try
        {
            LoadingChange(true);

            if (!string.IsNullOrWhiteSpace(preferencesService.FilePathMdbPreference))
                PathFull = preferencesService.FilePathMdbPreference; 

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

    public void InitilizedVM()
    {
        throw new NotImplementedException();
    }
    public void ClearPath()
    {
        PathFull = string.Empty;

        preferencesService.FilePathMdbPreference = string.Empty;
    }
    public async Task SelectPath()
    {
        PathFull = await pickUpFileService.PickUpMDBAsync(); // Select File Access .mdb Button
        
        if (!string.IsNullOrWhiteSpace(PathFull)) 
            preferencesService.FilePathMdbPreference = PathFull;
    }
    public async Task SyncDictionary()
    {
        try
        {
            // is file selected
            if (string.IsNullOrWhiteSpace(PathFull))
            {
                await displayAlertService.DisplayMessage(
                    "Ошибка", 
                    "Путь к базе данных Access не выбран",
                    "OK");
                return;
            }

            // is path correct
            if (!File.Exists(PathFull))
            {
                await displayAlertService.DisplayMessage(
                    "Ошибка",
                    "По выбранному пути файла Access не существует",
                    "OK");
                return;
            }

            LoadingChange(true);

            bool isSyncHaveErrors = await SyncAllDictionary();

            if (isSyncHaveErrors)
            {
                await displayAlertService.DisplayMessage(
                    "Ошибка!",
                    $"Ошибка при загрузке справочников, некоторые справочники загруженны некоректно",
                    "OK");
            }
            else
            {
                await displayAlertService.DisplayMessage(
                    "Синхронизация справочников",
                    $"Все справочники успешно синхронизированны",
                    "OK");
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
    #endregion

}
