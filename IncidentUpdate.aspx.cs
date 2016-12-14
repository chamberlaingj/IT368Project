using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IncidentUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] != null && Session["Role"].Equals("customer"))
        {
            Response.Redirect("Default.aspx");
        }
        else
        {

        }
    }

    protected void grdIncidents_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        ddlCustomers.DataBind();
    }
}