using System;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Collections;
using System.Data.OleDb;
using System.Configuration;

[DataObject(true)]
public class IncidentDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetOpenTechIncidents(int techID)
    {
        string selectStatement = "SELECT DateOpened, ProductCode, Name " + "FROM Incidents JOIN Customers " + "ON Incidents.CustomerID = Customers.CustomerID " + "WHERE DateClosed IS NULL " + "AND TechID = @TechID " +"ORDER BY DateOpened";
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        SqlCommand command = new SqlCommand(selectStatement, con);
        command.Parameters.AddWithValue("TechID", techID);
        con.Open();
        SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
        return reader;

    }
}