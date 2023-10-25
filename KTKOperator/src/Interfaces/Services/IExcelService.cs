using OperatorApp_Client.MVVMS.Models;

namespace OperatorApp_Client.Interfaces.Services;

public interface IExcelService
{
    string[] VarOfCellGroup { get; }
    List<TimeSpan> VarStartTime { get; set; }
    List<TimeSpan> VarEndTime { get; set; }
    string[] VarL1 { get; }
    string[] VarL2 { get; }
    string[] VarL3 { get; }
    string[] VarL4 { get; }

    Task<ScheduleGet> GetDataExcel(string srcFile);

}
