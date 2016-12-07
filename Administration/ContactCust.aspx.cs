using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;

public partial class ContactCust : System.Web.UI.Page
{ 
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string AccountSid = "ACb5e12563bfb0848030ce8b4218a4f468";
        string AuthToken = "09396ddfe43280a9c661820d7abdfac8";
        TwilioRestClient twilio = new TwilioRestClient(AccountSid, AuthToken);

        twilio.SendMessage("17085057088", "17082273328", "Your error has been fixed", "");
        Response.Redirect("ContactUs.aspx");
    }
}

