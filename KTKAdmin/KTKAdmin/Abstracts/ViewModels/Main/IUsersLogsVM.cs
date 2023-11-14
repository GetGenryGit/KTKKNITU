using KTKAdmin.Models;

namespace KTKAdmin.Abstracts.ViewModels.Main;

public interface IUsersLogsVM : IBaseVM
{
    #region [Properties]
    List<HistoryItem> HistoryList { get; set; }

    #endregion

    #region [MainMethods]
    Task UpdateLogs();

    #endregion
}
