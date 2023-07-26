using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if(!IsPostBack)
            if (Request.Cookies["User"] != null)
            {
                show();
            }

        }
        protected void show()
        {
            using (Entities1 db = new Entities1())
            {
                int customerid = Convert.ToInt32(Request.Cookies["User"]["time"]);
                var data = db.cartinginfo(customerid).ToList();
                form.DataSource = data;
                form.DataBind();
            }
        }

        protected void confirmBtn_Click(object sender, EventArgs e)
        {

        }

        protected void form_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                using (Entities1 db = new Entities1())
                {
                    int customerid = Convert.ToInt32(Request.Cookies["User"]["time"]);
                    db.deletefromcart(customerid, Convert.ToInt32(e.CommandArgument));
                    db.SaveChanges();
                    show();
                }
            }
        }

        protected void form_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void checkoutBtn_Click(object sender, EventArgs e)
        {
            int customerid = Convert.ToInt32(Request.Cookies["User"]["time"]);
            using (Entities1 db = new Entities1())
            {
                tblmainOrder order = new tblmainOrder();
                order.orderMainname = fullName.Text;
                order.orderMainphoneno = number.Text;
                order.orderMainEmail = email.Text;
                order.orderMainaddress = address.Text;
               

                db.tblmainOrders.Add(order);
                db.SaveChanges();
                int mainorderid = Convert.ToInt32(order.orderMainid);
                var products = db.cartinginfo(customerid);
                foreach (var product in products)
                {
                    orderdetail orderdetail = new orderdetail();
                    orderdetail.OrdermainID = mainorderid;
                    orderdetail.Productid = Convert.ToInt32(product.productid);
                   
                    orderdetail.price = product.price;
                    db.orderdetails.Add(orderdetail);
                   
                }
                db.SaveChanges();
               
                Class1.SendEmail(order.orderMainEmail,"Order Confirmation","ThankYou for order! Your order is confirmed.");
                Response.Redirect("checkout.aspx");


            }
        }

    }
    
}