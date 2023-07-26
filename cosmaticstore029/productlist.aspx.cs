using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class productlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Filladmin();

        }
        protected void Filladmin()
        {
            using (Entities1 db = new Entities1())
            {
                var product = db.listproduct().ToList();
                productGv.DataSource = product;
                productGv.DataBind();

            }
        }

        protected void productGv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Response.Redirect("addproduct.aspx?productid=" + e.CommandArgument);
            }
            else if (e.CommandName == "delete")
            {
                using (Entities1 db = new Entities1())
                {
                    int pID = Convert.ToInt32(e.CommandArgument);
                    db.deleteproduct(pID);


                }
                Filladmin();
            }

        }

        protected void productGv_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void productGv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void addproduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("addproduct.aspx");
        }

       

     
    }
}