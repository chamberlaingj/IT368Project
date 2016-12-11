using System;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Collections;
using SportsPro.Models;

[DataObject(true)]
public class IncidentDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetOpenTechIncidents(int techID)
    {
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        string sel = "SELECT DateOpened, ProductCode, Name " +
            "FROM Incidents JOIN Customers " +
            "ON Incidents.CustomerID = Customers.CustomerID " +
            "WHERE DateClosed IS NULL " +
            "AND TechID = @TechID " +
            "ORDER BY DateOpened";
        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("TechID", techID);
        con.Open();
        SqlDataReader rdr =
            cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return rdr;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetCustomerIncidents(int CustomerID)
    {
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        string sel = "SELECT IncidentID, ProductCode, "
                   + "DateOpened, DateClosed, Title, Description "
                   + "FROM Incidents "
                   + "WHERE CustomerID = @CustomerID "
                   + "AND TechID IS NOT NULL";
        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("CustomerID", CustomerID);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;
    }

  
}