using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Guswin
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                lblUser.Text = "Welcome back, " + Session["username"].ToString();
            }
            else
            {
                lblUser.Text = "Welcome back, Guest";
            }
        }
    }
}