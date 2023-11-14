using KTKAdmin.Models;

namespace KTKAdmin.Abstracts.ViewModels.Main;

public interface IDictionariesVM : IBaseVM
{
    #region [Properties]
    string PathFull { get; set; }

    List<DictionaryItem> CollectivesList { get; set; }
    List<DictionaryItem> TeachersList { get; set; }
    List<DictionaryItem> SubjectsList { get; set; }
    List<DictionaryItem> ClassroomsList { get; set; }
    #endregion

    #region [MainMethods]
    Task SelectPath();
    Task SyncDictionary();
    #endregion
}
