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
        //if (Session["Role"] != null && Session["Role"].Equals("admin"))
        //{

        //}
        //else
        //{
        //    Response.Redirect("Default.aspx");
        //}
    }

    private Customer GetselectedCustomer()
    {
        Customer customer = new Customer();
        customer.CustomerID = Convert.ToInt32(GridView1.Rows[0].Cells[0].Text.ToString());
        customer.Name = GridView1.Rows[0].Cells[1].Text.ToString();
        customer.Address = GridView1.Rows[0].Cells[2].Text.ToString();
        customer.City = GridView1.Rows[0].Cells[2].Text.ToString();
        customer.State = GridView1.Rows[0].Cells[3].Text.ToString();
        customer.ZipCode = GridView1.Rows[0].Cells[4].Text.ToString();
        customer.Phone = GridView1.Rows[0].Cells[5].Text.ToString();
        customer.Email = GridView1.Rows[0].Cells[1].Text.ToString();
        return customer;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
        {
            selectedCustomer = this.GetselectedCustomer();
            CustomerList contacts = CustomerList.GetCustomers();
            string temp = GridView1.Rows[0].Cells[1].Text.ToString();
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