using KTKAdmin.Abstracts.Services;
using System.Data.OleDb;

namespace KTKAdmin.Services;

public class AccessService : IAccessService
{
    #region [MainMethods]
    public List<object> ReadGroups(string connString)
    {
        var list = new List<object>();

        using (var conn = new OleDbConnection(connString))
        {
            string query = "SELECT NAIM FROM SPGRUP;";

            conn.Open();

            var cmd = new OleDbCommand(query, conn);

            OleDbDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                var group = reader.GetString(0);

                list.Add(group);
            }

            return list;
        }
    }
    public List<object> ReadTeachers(string connString)
    {
        var list = new List<object>();

        using (var conn = new OleDbConnection(connString))
        {
            string query = "SELECT FAMIO FROM SPPREP;";

            conn.Open();

            OleDbCommand cmd = new OleDbCommand(query, conn);

            OleDbDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                var teacher = reader.GetString(0);

                list.Add(teacher);
            }

            return list;
        }
    }
    public List<object> ReadSubjects(string connString)
    {
        var list = new List<object>();

        using (var conn = new OleDbConnection(connString))
        {
            string query = "SELECT NAIM FROM SPPRED;";

            conn.Open();

            OleDbCommand cmd = new OleDbCommand(query, conn);

            OleDbDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                var subject = reader.GetString(0);

                list.Add(subject);
            }

            return list;
        }
    }
    public List<object> ReadClassroom(string connString)
    {
        var list = new List<object>();

        using (var conn = new OleDbConnection(connString))
        {
            string query = "SELECT KAUDI FROM SPKAUD;";

            conn.Open();

            OleDbCommand cmd = new OleDbCommand(query, conn);

            OleDbDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                var classroom = reader.GetString(0);

                list.Add(classroom);
            }

            return list;
        }
    }
    #endregion
}
