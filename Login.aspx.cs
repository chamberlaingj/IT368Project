using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginControl_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string username = Login1.UserName;
        string password = Login1.Password;
        string checker = "SELECT * FROM Users WHERE Username = " + "'" + username + "' AND Password = " + "'" + password + "'";
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        SqlCommand cmd = new SqlCommand(checker, con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (!rdr.HasRows)
        {
            Login1.FailureText = "NOO!";
            return;
        }
        else
        {
            if (rdr.Read())
            {
                String x = rdr["Role"].ToString();
                Session["Role"] = x;
                con.Close();
                Response.Redirect("ContactUs.aspx");
            }
        }
    }
}