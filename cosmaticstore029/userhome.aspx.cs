using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class userhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (IsPostBack) return;
            {
                if (Request.Cookies["User"] == null)
                {
                    Response.Cookies["User"]["time"] = DateTime.Now.ToString("hhmmssfff");
                    Response.Cookies["User"].Expires = DateTime.Now.AddDays(10);

                    Session["uniqueid"] = DateTime.Now.ToString("hhmmssfff");
                    Session.Timeout = 86400;

                }


                using (Entities1 db = new Entities1())
                {
                    if (Request.QueryString["brandid"] != null)
                    {
                        int brandid = Convert.ToInt32(Request.QueryString["brandid"]);
                        var showProd = db.sel(brandid).ToList();
                        Repeater1.DataSource = showProd;
                        Repeater1.DataBind();

                    }
                    else
                    {
                        var showProd = db.listproduct().ToList();
                        Repeater1.DataSource = showProd;
                        Repeater1.DataBind();
                    }
                }
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "addtocart")
            {
                if (Request.Cookies["User"] != null)
                {
                    using (Entities1 db = new Entities1())
                    {
                       
                        
                            tltemporary order = new tltemporary();
                            order.uniqueID = Convert.ToInt32(Request.Cookies["User"]["time"]);
                            order.productID = Convert.ToInt32(e.CommandArgument);
                           
                           
                                db.tltemporaries.Add(order);
                                db.SaveChanges();
                                Response.Redirect("userhome.aspx");
                            }
                       
                }
                else
                {
                    Response.Redirect("userhome.aspx");
                }
            }
        }

        protected void cartpage_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }
    }
    }
