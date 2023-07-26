using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                if (Request.Cookies["User"] != null)
                {
                    using (Entities1 db = new Entities1())
                    {
                        int customerid = Convert.ToInt32(Request.Cookies["User"]["time"]);
                        var data = db.cartinginfo(customerid).ToList();
                        repeater2.DataSource = data;
                        repeater2.DataBind();
                    }
                }
            }
        }

        protected void repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var price = e.Item.FindControl("prc") as Label;
            int p = Convert.ToInt32(price.Text);
            using (Entities1 db = new Entities1())
            {
                int t = Convert.ToInt32(tprice.Text);
                tprice.Text = Convert.ToString(t + p);
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            int customerid = Convert.ToInt32(Request.Cookies["User"]["time"]);
            using (Entities1 db = new Entities1()) {
                db.emptycart(customerid);
            }
                
            Response.Redirect("userhome.aspx");
          
        }
    }
}