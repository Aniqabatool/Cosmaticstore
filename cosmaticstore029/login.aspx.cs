using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Request.Cookies["adminlogin"] != null)
            {
                Session["email"] = Request.Cookies["adminlogin"]["email"];
                Session.Timeout = 720;
                Response.Redirect("home.aspx");
            }
        }
        public string encrypt_pass(string pass)
        {
            byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(pass);
            string e = Convert.ToBase64String(b);
            return e;


        }
        protected void btn_form_Click(object sender, EventArgs e)
        {
            using (Entities1 db = new Entities1())
            {
                var query = db.login(Email.Text, encrypt_pass(password.Text)).ToList();
                if (query.Count > 0)
                {
                    Session["email"] = query[0].email;
                    Session.Timeout = 720;

                    Response.Cookies["adminlogin"]["email"] = query[0].email.ToString();
                    Response.Cookies["adminlogin"].Expires = DateTime.Now.AddDays(1);
                    Response.Redirect("home.aspx");

                }
                else
                {
                    Response.Write("Invalide email or password");
                }
            }


        }
    }
}