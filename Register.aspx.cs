using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = TextBox1.Text.ToString();
        string email = TextBox2.Text.ToString();
        string password = TextBox3.Text.ToString();

        string statement = "INSERT INTO Users (username, email, password, role) VALUES (" + "'" + username + "'" + ", " + "'" + email + "'" + ",  " + "'" + password + "'" + ", 'customer')";
        string checker = "SELECT * FROM Users WHERE username = " + "'" + username + "'";
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        SqlCommand cmd = new SqlCommand(checker, con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (rdr.HasRows)
        {
            errLabel.Text = "Username taken";
            return;
        }
       
        else
        {
            con.Close();
            SqlConnection con2 = new SqlConnection(TechSupportDB.GetConnectionString());
            con2.Open();
            SqlCommand cmd2 = new SqlCommand(statement, con2);
            SqlDataReader rdr2 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);
            con2.Close();
            Session["Role"] = "Customer";
            Response.Redirect("ContactUs.aspx");
            return;
        }
    }
}