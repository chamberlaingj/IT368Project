using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IncidentDisplay : System.Web.UI.Page
{
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
    protected void IncidentForum(object sender, EventArgs e)
    {
        string s = (sender as Button).Text;
        Session["Chosen"] = s;
        Response.Redirect("IncidentForum");
    }

}