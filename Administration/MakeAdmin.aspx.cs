using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MakeAdmin : System.Web.UI.Page
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
        string sel = "UPUDATE customers " +
                   "SET Role = admin" +
                   "WHERE Name = " + "'" + name + "'";

        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        dr.Read();
        Label1.Text = "Success!";
        return;
    }

}