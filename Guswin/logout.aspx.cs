using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Guswin
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            //Response.Redirect("Default.aspx");
            Response.AddHeader("REFRESH", "2 ; URL=Default.aspx");
        }
    }
}