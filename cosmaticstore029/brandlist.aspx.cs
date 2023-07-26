using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class brandlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Fillbrand();

        }
        protected void Fillbrand()
        {
            using (Entities1 db = new Entities1())
            {
                var brand = db.addbrand().ToList();
                brandGv.DataSource = brand;
                brandGv.DataBind();

            }
        }
        protected void brandGv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Response.Redirect("addbrand.aspx?brandid=" + e.CommandArgument);
            }
            else if (e.CommandName == "delete")
            {
                using (Entities1 db = new Entities1())
                {
                    int ID = Convert.ToInt32(e.CommandArgument);
                    db.deletebrand(ID);


                }
                Fillbrand();
            }

        }

        protected void brandGv_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void brandGv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void addbrand_Click(object sender, EventArgs e)
        {
            Response.Redirect("addbrand.aspx");
        }
    }
}