using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;

public partial class ProductRegistration : System.Web.UI.Page
{
    DataView customerTable;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ListItem productItem = new ListItem("--Select a product--", "None");
            ddlProducts.Items.Add(productItem);
        }
    }

    protected void cvalCustomerID_ServerValidate(object source, ServerValidateEventArgs args)
    {
        customerTable = (DataView)
            SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        if (customerTable.Count == 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
            DataRowView customerRow = customerTable[0];
            lblCustomer.Text = customerRow["Name"].ToString();
            btnRegister.Enabled = true;
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        SqlDataSource3.InsertParameters["CustomerID"].DefaultValue
            = txtCustomerID.Text;
        SqlDataSource3.InsertParameters["ProductCode"].DefaultValue
            = ddlProducts.SelectedValue;
        SqlDataSource3.InsertParameters["RegistrationDate"].DefaultValue
            = DateTime.Today.ToShortDateString();
        try
        {
            SqlDataSource3.Insert();
            this.SendEmailConfirmation();
            txtCustomerID.Text = "";
            lblCustomer.Text = "";
            ddlProducts.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
            Session["Exception"] = ex;
            Session["Page"] = "~/Customer/ProductRegistration.aspx";
            Response.Redirect("~/ErrorMessage.aspx");
        }
        finally
        {
            btnRegister.Enabled = false;
        }
    }

    private void SendEmailConfirmation()
    {
        MailAddress fromAdd = new MailAddress("sportspro@sportsprosoftware.com");
        MailAddress toAdd = new MailAddress("anne@murach.com");
        MailMessage msg = new MailMessage(fromAdd, toAdd);
        msg.Subject = "Product registration";
        msg.Body = "Thank you for registering " + ddlProducts.SelectedItem.Text
            + " with us. You will be notified of any future updates.<br /><br />The Sports Pro Team";
        msg.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("localhost");
        client.Send(msg);
        lblErrorMessage.Text = "Registration successful!";
    }
}