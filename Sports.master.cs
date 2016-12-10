using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
using System.Web.Services;
public partial class Sports : System.Web.UI.MasterPage
    {
    Button button;
        protected void Page_Load(object sender, EventArgs e)
        {
        if (Session["Role"] != null)
        {
            if (Session["Role"].Equals("customer") || Session["Role"].Equals("admin") || Session["Role"].Equals("tech"))
            {
                Session["log"] = "true";
                button = new Button
                {
                    ID = "Button3",
                    Text = "Logout"
                };
            button.Click += LinkButton_Click;
                PlaceHolder1.Controls.Add(button);
            }
         }
        else
        {
            return;
        }


    }
    protected void LinkButton_Click(object sender, EventArgs e)
    {
        Session["Role"] = null;
        this.Controls.Remove(button);
        Response.Redirect("Default.aspx");



    }

}
