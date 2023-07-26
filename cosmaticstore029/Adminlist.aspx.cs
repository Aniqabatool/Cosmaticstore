using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class Adminlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Filladmin();

        }
        protected void Filladmin()
        {
            using (Entities1 db = new Entities1())
            {
                var admins = db.getadmin().ToList();
                Gv.DataSource = admins;
                Gv.DataBind();

            }
        }

        protected void Gv_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void Gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void Gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="edit")
            {
                Response.Redirect("Addadmin.aspx?adminID=" + e.CommandArgument);
            }
            else if(e.CommandName=="delete")
            {
               using (Entities1 db =new Entities1())
                {
                    int ID = Convert.ToInt32(e.CommandArgument);
                    db.deleteadmin(ID);

                   
                }
                Filladmin();
            }

        }

        protected void addadmin_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("Addadmin.aspx");
        }
    }
}