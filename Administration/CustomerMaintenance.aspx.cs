using System;
using System.Configuration;
using System.Data.OleDb;
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
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "A database error has occurred. ";
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "CONCURRENCY! ERROR! ERROR! ERROR!";
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

    }

    protected void dtlCustomers_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}