using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;

public partial class ContactCust : System.Web.UI.Page
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        string name = DropDownList1.Text.ToString();
        string sel = "SELECT Phone " +
                   "FROM Customers " +
                   "WHERE Name = " + "'" + name + "'";
                   
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        dr.Read();
        string number = dr["Phone"].ToString();
        string AccountSid = "ACb5e12563bfb0848030ce8b4218a4f468";
        string AuthToken = "09396ddfe43280a9c661820d7abdfac8";
        string message = TextBox1.Text.ToString();
        TwilioRestClient twilio = new TwilioRestClient(AccountSid, AuthToken);

        twilio.SendMessage("17085057088", number,message, "");
        TextBox1.Text = String.Empty;
        return;
    }
}

