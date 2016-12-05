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
        string selectStatement = "SELECT DateOpened, ProductCode, Name " + "FROM Incidents JOIN Customers " + "ON Incidents.CustomerID = Customers.CustomerID " + "WHERE DateClosed IS NULL " + "AND TechID = ? " +
           "ORDER BY DateOpened";
        OleDbDataAdapter oledbAdapter = new OleDbDataAdapter();
        string connDB = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        OleDbConnection con = new OleDbConnection(connDB);
        OleDbCommand command = new OleDbCommand(selectStatement, con);
        con.Open();
        OleDbDataReader reader = command.ExecuteReader();
        return reader;

    }
}