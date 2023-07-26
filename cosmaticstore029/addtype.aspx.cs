using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class addtype : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (IsPostBack) return;
            using (Entities1 db = new Entities1())
            {
                if (Request.QueryString["typeid"] != null)
                {
                    int typeid = Convert.ToInt32(Request.QueryString["typeid"]);
                    producttype ad = db.producttypes.FirstOrDefault(v => v.typeid == typeid);

                    if (ad != null)
                    {
                        typename.Text = ad.typename;
                    }
                }
            }

        }

        protected void Save_Click(object sender, EventArgs e)
        {

            using (Entities1 db = new Entities1())
            {
                producttype s = null;
                if (Request.QueryString["typeid"] != null)
                {

                    int typeid = Convert.ToInt32(Request.QueryString["typeid"]);
                    s = db.producttypes.FirstOrDefault(v => v.typeid == typeid);
                }
                else
                {

                    s = new producttype();
                }
                s.typename = typename.Text;


                if (Request.QueryString["typeid"] == null)
                {
                    db.producttypes.Add(s);
                }
                db.SaveChanges();
                lblmsg.Text = "Type added sucessfully";
            }
        }
    }

}
   