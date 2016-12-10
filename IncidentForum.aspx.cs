using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IncidentForum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string incident = Session["Chosen"].ToString();
        Label1.Text = incident;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Random rnd = new Random();
        int id = rnd.Next(1, 80);
        string incident2 = Session["Chosen"].ToString();
        string comment = TextBox1.Text.ToString();
        string statement = "INSERT INTO Forum (CommentID, ForumID, Comment) VALUES (" + "'" + id + "'" + ", " + "'" + incident2 + "'" + ",  " + "'" + comment + "'" +")";
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        SqlCommand cmd = new SqlCommand(statement, con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Response.Redirect("IncidentForum.aspx");
    }
}