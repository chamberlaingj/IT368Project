﻿using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerMaintenance : System.Web.UI.Page
{
  

    protected void dtlCustomers_Inserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null){
            lblErrorMessage.Text = "A database error has occurred. ";
            e.ExceptionHandled = true;
        }
        else
            maintainCustomers.DataBind();
    }
    protected void dtlCustomers_Deleted(object sender, DetailsViewDeletedEventArgs e)
    {

        string ID = (dtlCustomers.Rows[0].Cells[1].Text.ToString());
        int ID1 = Int32.Parse(ID);
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        string sel = "DELETE "
                   + "FROM Customers "
                   + "WHERE CustomerID = '" + ID1 + "'";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        con.Close();
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "A database error has occurred. ";
            e.ExceptionHandled = true;
        }
        else
            maintainCustomers.DataBind();
    }
    protected void dtlCustomers_Updated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null) {
            lblErrorMessage.Text = "A database error has occurred. ";
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "CONCURRENCY! ERROR! ERROR! ERROR!";
        else
            maintainCustomers.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] != null && Session["Role"].Equals("admin"))
        {

        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void dtlCustomers_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}