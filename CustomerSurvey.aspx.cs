using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SportsPro.Models;
using System.Data.SqlClient;

public partial class CustomerSurvey : System.Web.UI.Page
{
    private DataView incidentsTable;

    protected void btnGetIncidents_Click(object sender, EventArgs e)
    {
        int customerID = Convert.ToInt32(txtCustomerID.Text.ToString());
        SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
        string selectStatement = "SELECT * "
                   + "FROM Incidents "
                   + "WHERE DateClosed IS NOT NULL AND CustomerID = @CustomerID";
        SqlCommand command = new SqlCommand(selectStatement, con);
        command.Parameters.AddWithValue("CustomerID", customerID);
        con.Open();
        SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);

        if (reader.HasRows)
        {
            lstIncidents.Items.Add(new ListItem("--Select an incident--", "None"));
            while (reader.Read())
            {
                Incident incident = new Incident();
                incident.IncidentID = Convert.ToInt32(reader["IncidentID"]);
                incident.ProductCode = reader["ProductCode"].ToString();
                incident.DateClosed = Convert.ToDateTime(reader["DateClosed"]);
                incident.Title = reader["Title"].ToString();
                lstIncidents.Items.Add(new ListItem(
                    incident.CustomerIncidentDisplay(), incident.IncidentID.ToString()));
            }
            lstIncidents.SelectedIndex = 0;
            lblNoIncidents.Text = "";
            this.EnableControls(true);
            lstIncidents.Focus();
        }
        else
        {
            lblNoIncidents.Text = "There are no incidents for that customer.";
            this.EnableControls(false);
        }
    }

    private void EnableControls(bool enable)
    {
        lstIncidents.Enabled = enable;
        lblHeading.Enabled = enable;
        lblResponseTime.Enabled = enable;
        rblResponseTime.Enabled = enable;
        lblEfficiency.Enabled = enable;
        rblEfficiency.Enabled = enable;
        lblResolution.Enabled = enable;
        rblResolution.Enabled = enable;
        lblComments.Enabled = enable;
        txtComments.Enabled = enable;
        chkContact.Enabled = enable;
        rdoContactByEmail.Enabled = enable;
        rdoContactByPhone.Enabled = enable;
        btnSubmit.Enabled = enable;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Survey survey = new Survey();
            survey.CustomerID = Convert.ToInt32(txtCustomerID.Text);
            survey.IncidentID = Convert.ToInt32(lstIncidents.SelectedValue);
            if (rblResponseTime.SelectedIndex != -1)
            {
                survey.ResponseTime = Convert.ToInt32(rblResponseTime.SelectedValue);
            }
            if (rblEfficiency.SelectedIndex != -1)
            {
                survey.TechEfficiency = Convert.ToInt32(rblEfficiency.SelectedValue);
            }
            if (rblResolution.SelectedIndex != -1)
            {
                survey.Resolution = Convert.ToInt32(rblResolution.SelectedValue);
            }
            survey.Comments = txtComments.Text;
            if (chkContact.Checked)
            {
                survey.Contact = true;
                if (rdoContactByEmail.Checked)
                    survey.ContactBy = "Email";
                else
                    survey.ContactBy = "Phone";
                Session.Add("Contact", true);
            }
            else
            {
                survey.Contact = false;
                Session.Add("Contact", false);
            }
            Response.Redirect("SurveyComplete");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {

        }
    }
}
