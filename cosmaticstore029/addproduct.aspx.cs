using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class addproduct1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (IsPostBack) return;
            using (Entities1 db = new Entities1())
            {
                var productbrand = db.fetchproductbrand().ToList();
                ddlbrand.DataSource = productbrand;
                ddlbrand.DataTextField = "brandname";
                ddlbrand.DataValueField = "brandid";
                ddlbrand.DataBind();
                ddlbrand.Items.Insert(0, new ListItem("select", "0"));
            }

            using (Entities1 db = new Entities1())
            {
                var producttype = db.typeproduct().ToList();
                ddltype.DataSource = producttype;
                ddltype.DataTextField = "typename";
                ddltype.DataValueField = "typeid";
                ddltype.DataBind();
                ddltype.Items.Insert(0, new ListItem("select", "0"));
            }

            using (Entities1 db = new Entities1())
            {
                if (Request.QueryString["productid"] != null)
                {
                    int productid = Convert.ToInt32(Request.QueryString["productid"]);
                    addproduct ad = db.addproducts.FirstOrDefault(v => v.productid == productid);
                    if (ad != null)
                    {
                        prodname.Text = ad.productname;
                        ddlbrand.SelectedValue = Convert.ToString(ad.brandid);
                        ddltype.SelectedValue = Convert.ToString(ad.typeid);
                        prodcolor.Text = ad.productcolor;
                        prodprice.Text = Convert.ToString(ad.price);
                        prodweight.Text = Convert.ToString(ad.productweight);


                    }
                }

            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            using (Entities1 db = new Entities1())
            {
                addproduct s = null;
                if (Request.QueryString["productid"] != null)
                {

                    int productid = Convert.ToInt32(Request.QueryString["productid"]);
                    s = db.addproducts.FirstOrDefault(v => v.productid == productid);
                }
                else
                {

                    s = new addproduct();
                }
                if (image.HasFile)
                {
                    string file = image.PostedFile.FileName;
                    image.SaveAs(Server.MapPath("~/images/" + file));
                    s.productimage = file;
                }
                s.productname = prodname.Text;
                s.productcolor = prodcolor.Text;
                s.typeid = Convert.ToInt32(ddltype.Text);
                s.brandid = Convert.ToInt32(ddlbrand.Text);
                s.price = Convert.ToInt32(prodprice.Text);
                s.productweight = Convert.ToDouble(prodweight.Text);

                if (Request.QueryString["productid"] == null)
                {
                    db.addproducts.Add(s);
                }
                db.SaveChanges();
                lblmsg.Text = "product added sucessfully";
            }
        }
    }
}