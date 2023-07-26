using System;
using System.Net.Mail;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cosmaticstore029
{
    public class Class1
    {
        public static bool SendEmail(string toadd, string subject, string msg, string cc = "", string bcc = "")
        {
            MailMessage message = new MailMessage();
            SmtpClient client = new SmtpClient();
            try
            {
                string SendingEmail = "", MailServer = "", SendingPassword = "";
                SendingEmail = "aniqabatool86@gmail.com";
                MailServer = "smtp.gmail.com";
                SendingPassword = "qtseugjvhtqzizxz";
                int ServerPort = 587;
                message.IsBodyHtml = true;

                message.From = new MailAddress(SendingEmail, "Noreply");

                if (toadd.Contains(","))
                {
                    string[] arrto = toadd.Split(',');
                    for (int i = 0; i <= arrto.Length - 1; i++)
                    {
                        if (!string.IsNullOrEmpty(arrto[i].Trim()))
                        {
                            message.To.Add(new MailAddress(arrto[i].Trim()));
                        }
                    }
                }
                else
                {
                    message.To.Add(new MailAddress(toadd.ToString()));
                }

                if (!string.IsNullOrEmpty(cc))
                {
                    message.CC.Add(new MailAddress(cc.ToString()));
                }

                if (!string.IsNullOrEmpty(bcc))
                {
                    message.Bcc.Add(new MailAddress(bcc.ToString()));
                }
                message.Body = msg;
                message.Subject = subject;

                client.Host = MailServer;
                client.Port = ServerPort;
                client.EnableSsl = true;
                client.UseDefaultCredentials = true;
                client.Credentials = new System.Net.NetworkCredential(SendingEmail, SendingPassword);

                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                message = null;
                client = null;
            }
        }
    }
}