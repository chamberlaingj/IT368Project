using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Data.OleDb;
using System.Configuration;

[DataObject(true)]
public static class TechnicianDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetAllTechnicians()
    {
        string selectStatement = "SELECT TechID, Name " + "FROM Technicians ORDER BY Name";
        OleDbDataAdapter oledbAdapter = new OleDbDataAdapter();
        string connDB = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        OleDbConnection con = new OleDbConnection(connDB);
        OleDbCommand command = new OleDbCommand(selectStatement, con);
        con.Open();
        OleDbDataReader reader = command.ExecuteReader();
        return reader;




    }
}