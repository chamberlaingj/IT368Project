using System;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Collections;

[DataObject(true)]
public static class CustomerDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetCustomerList()
    {
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        string sel = "SELECT CustomerID, Name "
                   + "FROM Customers "
                   + "ORDER BY Name";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetCustomersWithIncidents()
    {
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        string sel = "SELECT CustomerID, Name "
                   + "FROM Customers "
                   + "WHERE CustomerID IN "
                   + "(SELECT DISTINCT CustomerID "
                   + "FROM Incidents "
                   + "WHERE TechID IS NOT NULL) " 
                   + "ORDER BY Name";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;
    }
}
