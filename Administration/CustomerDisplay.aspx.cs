using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SportsPro.Models;

public partial class CustomerDisplay : System.Web.UI.Page
    {
        private SportsPro.Models.Customer selectedCustomer;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            CustomerList contacts = CustomerList.GetCustomers();
            Customer customer = contacts[selectedCustomer.Name];
            if (customer == null)
            {
                contacts.AddItem(selectedCustomer);
                Response.Redirect("ContactDisplay");
            }
            else
            {
                lblErrorMessage.Text = "This customer is already in the contact list.";
            }
        }
    }