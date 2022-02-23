using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace Guswin
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lbldtRegistered.Text = DateTime.Now.ToString();

            sdsUser.Insert();

            //MailMessage mail = new MailMessage();
            //mail.From = new MailAddress("mwmflyeazy@gmail.com");
            //mail.To.Add(txtEmail.Text.Trim());
            //mail.Subject = "Account Creation";
            //mail.Body = "Dear " + txtFName.Text + ",<br />";
            //mail.Body += "Your account has been successfully created!";
            //mail.IsBodyHtml = true;

            //SmtpClient smtpServer = new SmtpClient("smtp.gmail.com", 587);
            //smtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
            //smtpServer.UseDefaultCredentials = false;
            //smtpServer.Credentials = new System.Net.NetworkCredential("mwmflyeazy@gmail.com", "mwmflyeazy.");
            //smtpServer.EnableSsl = true;
            //smtpServer.UseDefaultCredentials = true;
            //smtpServer.Send(mail);

            lblMessage.Text = "Thank You for registering and a confirmation Email has been send to your Email Address! Redirecting to Login.";
            Response.AddHeader("REFRESH", "5 ; URL=login.aspx");
        }
    }
}