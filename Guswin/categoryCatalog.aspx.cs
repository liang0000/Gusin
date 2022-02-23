using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Guswin
{
    public partial class categoryCatalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Session["uid"] != null) && (Session["admin"] != null))
                {
                    clearFields();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            lbldtAdded.Text = DateTime.Now.ToString();
            sqlDSCategory.Insert();
            clearFields();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lbldtAdded.Text = DateTime.Now.ToString();
            sqlDSCategory.Update();
            clearFields();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            sqlDSCategory.Delete();
            clearFields();
        }
        private void clearFields()
        {
            txtCName.Text = "";
            txtCDesc.Text = "";
            txtCName.Focus();
        }

        protected void gvCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCID.Text = gvCategory.SelectedRow.Cells[1].Text;
            txtCName.Text = gvCategory.SelectedRow.Cells[2].Text;
            txtCDesc.Text = gvCategory.SelectedRow.Cells[3].Text;
        }

        protected void gvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Text = "ID";
                e.Row.Cells[2].Text = "Category";
                e.Row.Cells[3].Text = "Desdription";
                e.Row.Cells[4].Text = "Date Added or Edited";
                e.Row.Cells[5].Text = "Active";
            }
        }
    }
}