using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TechnicianMaintenance : System.Web.UI.Page
{
    protected void fvTechnician_Deleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null){
            lblErrorMessage.Text = "A database error. ";
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0){
            lblErrorMessage.Text = "ERROR! ERROR! ERROR!";
        }
        else{
            ddlTechnicians.DataBind();
        }
    }

    protected void fvTechnician_Inserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null){
            lblErrorMessage.Text = "Database Error. ";
            e.ExceptionHandled = true;
        }
        else
        {
            ddlTechnicians.DataBind();
        }
    }

    protected void fvTechnician_Updated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null){
            lblErrorMessage.Text = "Database Error. ";
                
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0){
            lblErrorMessage.Text = "ERROR! ERROR! ERROR! ";
                
        }
        else{
            ddlTechnicians.DataBind();
        }
    }
}