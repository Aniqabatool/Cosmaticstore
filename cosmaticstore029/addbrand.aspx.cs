using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class addbrand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (IsPostBack) return;
            using (Entities1 db = new Entities1())
            {
                if (Request.QueryString["brandid"] != null)
                {
                    int brandid = Convert.ToInt32(Request.QueryString["brandid"]);
                    productbrand ad = db.productbrands.FirstOrDefault(v => v.brandID == brandid);

                    if (ad != null)
                    {
                        brandname.Text = ad.brandname;
                    }
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            using (Entities1 db = new Entities1())
            {
                productbrand s = null;
                if (Request.QueryString["brandID"] != null)
                {

                    int brandid = Convert.ToInt32(Request.QueryString["brandid"]);
                    s = db.productbrands.FirstOrDefault(v => v.brandID == brandid);
                }
                else
                {

                    s = new productbrand();
                }
                s.brandname = brandname.Text;
               

                if (Request.QueryString["brandid"] == null)
                {
                    db.productbrands.Add(s);
                }
                db.SaveChanges();
                lblmsg.Text = "Brand added sucessfully";
            }
        }
    }
}
    