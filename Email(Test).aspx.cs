using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;

namespace Assignment
{
    public partial class Email_Test_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            // **** Important Note *****
            // Please set up this three variable b4 sending email
            // Set receiver email
            string emailTo = TextBox1.Text;

            // Set sender and receiver email
            string emailFrom = "hmsagent1221@gmail.com";
            string password = "Asdfg12345@";
            try
            {
                using(MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(emailFrom);
                    mail.To.Add(emailTo);
                    mail.Subject = "Test Send Mail";
                    mail.Body = CreateEmailBody();
                    mail.IsBodyHtml = true;

                    using(SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.Credentials = new System.Net.NetworkCredential(emailFrom, password);
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                        Label1.Text = "Mail Sent";

                    }
                }
            }catch(Exception ex)
            {
                Label1.Text = ex.Message;
            }

        }

        private string CreateEmailBody()
        {
            string emailBody = String.Empty;

            using (StreamReader reader = new StreamReader(Server.MapPath("Template.html")))
            {
                emailBody = reader.ReadToEnd();
            }

            // Replace the text in Template.html
            emailBody = emailBody.Replace("{fname}", "Koh Xin Hao");
            emailBody = emailBody.Replace("{fage}", "18");
            emailBody = emailBody.Replace("{femail}", "kohxinhao@gmail.com");

            return emailBody;
        }
    }
}