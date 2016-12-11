using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Boolean taken = true;
        string address = TextBox1.Text.ToString();
        string email = TextBox2.Text.ToString();
        string password = TextBox3.Text.ToString();
        string name = TextBox9.Text.ToString() + " " + TextBox10.Text.ToString();
        string state = TextBox5.Text.ToString();
        string city = TextBox6.Text.ToString();
        string zipcode = TextBox7.Text.ToString();
        string phonenum = TextBox8.Text.ToString();
        string role = "customer";
        Random rnd = new Random();
        int customerID = rnd.Next(1000, 10000);
        SqlConnection con1 = new SqlConnection(TechSupportDB.GetConnectionString());
        con1.Open();
        string checker = "SELECT * FROM Customers WHERE Email = " + "'" + email + "'";
        SqlCommand comand1 = new SqlCommand(checker, con1);
        SqlDataReader reader1 = comand1.ExecuteReader(CommandBehavior.CloseConnection);
        if (reader1.HasRows)
        {
            con1.Close();
            errLabel.Text = "Email Already in Use";
        }
        else
        {
            string statement = "INSERT INTO Customers (Name, Address, City, State, ZipCode, Phone, Email, Password, Role) VALUES (" + "'" + name + "'" + ", " + "'" + address + "'" + ", " + "'" + city + "'" + ", " + "'" + state + "'" + ", " + "'" + zipcode + "'" + ", " + "'" + phonenum + "'" + ", " + "'" + email + "'" + ", " + "'" + password + "'" + ", " + "'" + role + "'" + ")";
            SqlConnection con2 = new SqlConnection(TechSupportDB.GetConnectionString());
            SqlCommand comand2 = new SqlCommand(statement, con2);
            con2.Open();
            SqlDataReader reader2 = comand2.ExecuteReader(CommandBehavior.CloseConnection);
            con2.Close();
            Session["Role"] = "customer";
            Session["Name"] = name;
            Session["Eamil"] = email;
            string AccountSid = "ACb5e12563bfb0848030ce8b4218a4f468";
            string AuthToken = "09396ddfe43280a9c661820d7abdfac8";
            TwilioRestClient twilio = new TwilioRestClient(AccountSid, AuthToken);
            twilio.SendMessage("17085057088", phonenum, "Welcome to SportPro "+name+" Your Email is: "+email+" and Password is: "+password+" You will need these for future Logins!", "");
            Response.Redirect("ContactUs.aspx");
        }
        return;
        
    }
}