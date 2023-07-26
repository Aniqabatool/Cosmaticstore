using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class typelist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Filltype();
        }

        protected void Filltype()
        {
            using (Entities1 db = new Entities1())
            {
                var type = db.addtype().ToList();
                typeGv.DataSource = type;
                typeGv.DataBind();

            }
        }
        protected void typeGv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Response.Redirect("addtype.aspx?typeid=" + e.CommandArgument);
            }
            else if (e.CommandName == "delete")
            {
                using (Entities1 db = new Entities1())
                {
                    int ID = Convert.ToInt32(e.CommandArgument);
                    db.deletetype(ID);


                }
                Filltype();
            }
        }

        protected void typeGv_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void typeGv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void addtype_Click(object sender, EventArgs e)
        {
            Response.Redirect("addtype.aspx");
        }
    }
}