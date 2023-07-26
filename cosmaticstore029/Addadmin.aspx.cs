using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cosmaticstore029
{
    public partial class Addadmin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (IsPostBack) return;
          
            using (Entities1 db = new Entities1())
            {
                if(Request.QueryString["adminID"] != null)
                {
                    int adminid = Convert.ToInt32(Request.QueryString["adminID"]);
                    adminlogin ad = db.adminlogins.FirstOrDefault(v => v.adminid == adminid);
                    if (ad != null)
                    {
                        txtfirstname.Text = ad.firstname;
                        txtlastname.Text = ad.lastname;
                        txtemail.Text = ad.email;
                        txtpassword.Text = decrypt_pass(ad.password);
                        
                    }
                }
             
            }
        }
        public string decrypt_pass(string epass)
        {
            byte[] b;
            string dpass;
            try
            {

                b = Convert.FromBase64String(epass);
                dpass = System.Text.ASCIIEncoding.ASCII.GetString(b);
            }
            catch (FormatException e)
            {
                dpass = "";
            }


            return dpass;
        }


        public string encrypt_pass(string pass)
        {
            byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(pass);
            string e = Convert.ToBase64String(b);
            return e;


        }

        protected void Save_Click(object sender, EventArgs e)
        { 
            using (Entities1 db = new Entities1())
            {
                adminlogin s = null;
                if (Request.QueryString["adminID"] != null)
                {
                    
                    int adminid = Convert.ToInt32(Request.QueryString["adminID"]);
                     s = db.adminlogins.FirstOrDefault(v => v.adminid == adminid);
                }
                else
                {
                    adminlogin ss = db.adminlogins.FirstOrDefault(v => v.email == txtemail.Text);
                    if (ss != null)
                    {
                        lblmsg.Text = "Email already exist";
                        return;
                    }
                     s = new adminlogin();       
                }
                s.firstname = txtfirstname.Text;
                s.lastname = txtlastname.Text;
                s.email = txtemail.Text;
                s.password = encrypt_pass(txtpassword.Text);
                s.status = true;
                if (Request.QueryString["adminID"] == null)
                {
                    db.adminlogins.Add(s);
                }
                db.SaveChanges();
                lblmsg.Text = "Admin added sucessfully";

            }
        }
    }
}