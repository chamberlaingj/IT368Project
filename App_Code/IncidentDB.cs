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

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateIncident(Incident original_Incident, Incident incident)
    {
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        string up = "UPDATE Incidents "
                  + "SET DateClosed = @DateClosed, "
                  + "Description = @Description "
                  + "WHERE IncidentID = @original_IncidentID "
                  + "AND ProductCode = @original_ProductCode "
                  + "AND DateOpened = @original_DateOpened "
                  + "AND (DateClosed = @original_DateClosed "
                  + "OR DateClosed IS NULL "
                  + "AND @original_DateClosed IS NULL) "
                  + "AND Title = @original_Title "
                  + "AND Description = @original_Description";
        SqlCommand cmd = new SqlCommand(up, con);

        if (incident.DateClosed == Convert.ToDateTime("01/01/0001 12:00:00 AM"))
            cmd.Parameters.AddWithValue("DateClosed", DBNull.Value);
        else
            cmd.Parameters.AddWithValue("DateClosed", incident.DateClosed);

        cmd.Parameters.AddWithValue("Description", incident.Description);
        cmd.Parameters.AddWithValue("original_IncidentID", original_Incident.IncidentID);
        cmd.Parameters.AddWithValue("original_ProductCode", original_Incident.ProductCode);
        cmd.Parameters.AddWithValue("original_DateOpened", original_Incident.DateOpened);

        if (original_Incident.DateClosed == Convert.ToDateTime("01/01/0001 12:00:00 AM"))
            cmd.Parameters.AddWithValue("original_DateClosed", DBNull.Value);
        else
            cmd.Parameters.AddWithValue("original_DateClosed", original_Incident.DateClosed);

        cmd.Parameters.AddWithValue("original_Title", original_Incident.Title);
        cmd.Parameters.AddWithValue("original_Description", original_Incident.Description);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
}