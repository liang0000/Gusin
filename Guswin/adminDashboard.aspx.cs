using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Guswin
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if ((Session["uid"] != null) && (Session["admin"] != null))
                {

                    lblWelcome.Text = "Current Admin: " + Session["username"].ToString();

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            lbldtRegistered.Text = DateTime.Now.ToString();
            sdsUser.Insert();
            clearFields();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lbldtRegistered.Text = DateTime.Now.ToString();
            sdsUser.Update();
            clearFields();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            sdsUser.Delete();
            clearFields();
        }
        private void clearFields()
        {
            txtFName.Text = "";
            txtLName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtFName.Focus();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblUID.Text = GridView1.SelectedRow.Cells[1].Text;
            txtFName.Text = GridView1.SelectedRow.Cells[2].Text;
            txtLName.Text = GridView1.SelectedRow.Cells[3].Text;
            txtEmail.Text = GridView1.SelectedRow.Cells[4].Text;
            txtPassword.Text = GridView1.SelectedRow.Cells[5].Text;
        }
    }
}