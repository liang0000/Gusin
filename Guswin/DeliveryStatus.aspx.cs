using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Guswin
{
    public partial class DeliveryStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["uid"] != null) && (Session["admin"] != null))
            {

            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        private void LoadUserName()
        {
            String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
            SqlConnection conn = new SqlConnection(connstr);
            conn.Open();

            String sqlQuery = "SELECT FName, LName FROM tblUsers WHERE uid = @uid";

            SqlCommand comm = new SqlCommand(sqlQuery, conn);
            comm.Parameters.AddWithValue("@uid", lblUID.Text);
            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read() == true)
            {
                lblUname.Text = reader["FName"].ToString() + " " + reader["LName"].ToString();
            }
            else
            {
                lblUname.Text = "";
            }
        }

            protected void btnUpdate_Click(object sender, EventArgs e)
        {
            String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
            SqlConnection conn = new SqlConnection(connstr);
            conn.Open();

            String sqlQuery = "UPDATE [tblOrderItem] SET [status] = @status WHERE [uid] = @uid";
            SqlCommand comm = new SqlCommand(sqlQuery, conn);
            comm.Parameters.AddWithValue("@status", ddlDelSta.SelectedValue);
            comm.Parameters.AddWithValue("@uid", lblUID.Text);

            comm.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("DeliveryStatus.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblUID.Text = GridView1.SelectedRow.Cells[2].Text;
            LoadUserName();
        }
    }
}