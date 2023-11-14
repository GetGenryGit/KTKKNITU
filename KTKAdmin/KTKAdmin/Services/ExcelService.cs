using KTKAdmin.Abstracts.Services;
using KTKAdmin.Models;
using Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;

namespace KTKAdmin.Services;

public class ExcelService : IExcelService
{
    #region [Properties]
    public Microsoft.Office.Interop.Excel.Application app { get; set; }
    public Workbook workbook { get; set; }
    public Worksheet worksheet { get; set; }

    private string[] varOfCellGroup = new string[] { "E", "J", "O", "T" };
    public string[] VarOfCellGroup => varOfCellGroup;

    public List<TimeSpan> VarStartTime { get; set; } = new();

    public List<TimeSpan> VarEndTime { get; set; } = new();

    private string[] varL1 = new string[] { "E", "F", "G", "H" };
    public string[] VarL1 => varL1;

    private string[] varL2 = new string[] { "J", "K", "L", "M" };
    public string[] VarL2 => varL2;

    private string[] varL3 = new string[] { "O", "P", "Q", "R" };
    public string[] VarL3 => varL3;

    private string[] varL4 = new string[] { "T", "U", "V", "W" };
    public string[] VarL4 => varL4;
    #endregion

    #region [MainMethods]
    public async Task<ScheduleGet> GetDataExcel(string srcFile)
    {
        var schedule = new ScheduleGet();

        if (string.IsNullOrWhiteSpace(srcFile))
            return schedule;


        app = new Microsoft.Office.Interop.Excel.Application { Visible = false };
        workbook = app.Workbooks.Open(srcFile);
        worksheet = workbook.Worksheets[1];

        int startReadGroup = 7;
        int startReadLesson = 8;

        int countOfLessons = 0;

        int tmpItem = 8;

        VarStartTime.Clear();
        VarEndTime.Clear();

        while (true)
        {
            if (!string.IsNullOrWhiteSpace(worksheet.Range["A" + tmpItem].Value))
            {
                var timeStr = worksheet.Range["C" + tmpItem].Value;

                var timeArr = timeStr.Split('-');

                var timeStartSplit = timeArr[0].Split('.', ':');

                VarStartTime.Add(new TimeSpan(Convert.ToInt32(timeStartSplit[0]), Convert.ToInt32(timeStartSplit[1]), 0));

                var timeEndSplit = timeArr[1].Split('.', ':');

                VarEndTime.Add(new TimeSpan(Convert.ToInt32(timeEndSplit[0]), Convert.ToInt32(timeEndSplit[1]), 0));

                countOfLessons += 1;
                tmpItem += 2;
            }
            else
            {
                break;
            }
        }

        schedule.startTimeList = VarStartTime;
        schedule.endTimeList = VarEndTime;

        tmpItem -= 7;

        bool isRead = true;
        await Task.Run(() =>
        {
            while (isRead)
            {
                for (int i = 0; i < 4; i++)
                {
                    if (string.IsNullOrWhiteSpace(worksheet.Range[VarOfCellGroup[i] + startReadGroup].Value))
                    {
                        isRead = false;
                        break;
                    }

                    var lessonItems = new ScheduleItemObj(); // with title group
                    lessonItems.Title = worksheet.Range[VarOfCellGroup[i] + startReadGroup].Value;

                    for (int j = 0; j <= countOfLessons - 1; j++)
                    {
                        var lessonItem = new LessonItemObj { Index = j + 1 };

                        lessonItem.StartAt = VarStartTime[j];
                        lessonItem.EndAt = VarEndTime[j];

                        if (i == 0)
                        {
                            if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL1[0] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL1[1] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL1[0] + (startReadLesson + j * 2 + 1)].Value)) // one
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL1[0] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL1[1] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL1[0] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 1;

                                lessonItem.Items.Add(item);
                            }
                            if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL1[2] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL1[3] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL1[2] + (startReadLesson + j * 2 + 1)].Value)) // two
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL1[2] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL1[3] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL1[2] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 2;

                                lessonItem.Items.Add(item);
                            }
                            else if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL1[0] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL1[3] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL1[0] + (startReadLesson + j * 2 + 1)].Value)) // single
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL1[0] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL1[3] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL1[0] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 0;

                                lessonItem.Items.Add(item);
                            }


                        }
                        if (i == 1)
                        {
                            if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL2[0] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL2[1] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL2[0] + (startReadLesson + j * 2 + 1)].Value)) // one
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL2[0] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL2[1] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL2[0] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 1;

                                lessonItem.Items.Add(item);
                            }
                            if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL2[2] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL2[3] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL2[2] + (startReadLesson + j * 2 + 1)].Value)) // two
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL2[2] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL2[3] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL2[2] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 2;

                                lessonItem.Items.Add(item);
                            }
                            else if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL2[0] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL2[3] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL2[0] + (startReadLesson + j * 2 + 1)].Value)) // single
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL2[0] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL2[3] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL2[0] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 0;

                                lessonItem.Items.Add(item);
                            }

                        }
                        if (i == 2)
                        {

                            if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL3[0] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL3[1] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL3[0] + (startReadLesson + j * 2 + 1)].Value)) // one
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL3[0] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL3[1] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL3[0] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 1;

                                lessonItem.Items.Add(item);
                            }
                            if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL3[2] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL3[3] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL3[2] + (startReadLesson + j * 2 + 1)].Value)) // two
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL3[2] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL3[3] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL3[2] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 2;

                                lessonItem.Items.Add(item);
                            }
                            else if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL3[0] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL3[3] + +(startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL3[0] + (startReadLesson + j * 2 + 1)].Value)) // signle
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL3[0] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL3[3] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL3[0] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 0;

                                lessonItem.Items.Add(item);
                            }

                        }
                        if (i == 3)
                        {
                            if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL4[0] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL4[1] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL4[0] + (startReadLesson + j * 2 + 1)].Value)) // one
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL4[0] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL4[1] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL4[0] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 1;

                                lessonItem.Items.Add(item);
                            }
                            if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL4[2] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL4[3] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL4[2] + (startReadLesson + j * 2 + 1)].Value)) // two
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL4[2] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL4[3] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL4[2] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 2;

                                lessonItem.Items.Add(item);
                            }
                            else if (!string.IsNullOrWhiteSpace(worksheet.Range[VarL4[0] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL4[3] + (startReadLesson + j * 2)].Value) &&
                                !string.IsNullOrWhiteSpace(worksheet.Range[VarL4[0] + (startReadLesson + j * 2 + 1)].Value)) // single
                            {
                                var item = new ItemObj();

                                item.Title1 = worksheet.Range[VarL4[0] + (startReadLesson + j * 2)].Value;
                                item.Title2 = worksheet.Range[VarL4[3] + (startReadLesson + j * 2)].Value;
                                item.Title3 = worksheet.Range[VarL4[0] + (startReadLesson + j * 2 + 1)].Value;

                                item.SubGroup = 0;

                                lessonItem.Items.Add(item);
                            }

                        }

                        lessonItems.LessonItems.Add(lessonItem);
                    }
                    schedule.scheduleObjList.ScheduleItems.Add(lessonItems);
                }
                startReadGroup += tmpItem;
                startReadLesson += tmpItem;
            }
            app.Workbooks.Close();
            app.Quit();

            Marshal.ReleaseComObject(worksheet);
            Marshal.ReleaseComObject(workbook);
            Marshal.ReleaseComObject(app);
        });

        return schedule;
    }
    #endregion
}
