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
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        
        SqlCommand command = new SqlCommand(selectStatement, con);
        con.Open();
        SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
        return reader;



    }
}