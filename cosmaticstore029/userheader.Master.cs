using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class userheader : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (Entities1 sq = new Entities1())
            {

                var brand = sq.addbrand().ToList();
                GVHEADER.DataSource = brand;
                GVHEADER.DataBind();
            }
        }

              

         
        protected void GVHEADER_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }
        protected void Brand_Command1(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "brand")
            {
                Response.Redirect("userhome.aspx?brandid=" + e.CommandArgument);
            }
        }
    }
    } 
