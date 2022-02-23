using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//step 1 - namespaces
using System.Data; //sql commands select insert update delete
using System.Data.SqlClient;
using System.Configuration; //ConnString2509

namespace Guswin
{
    public partial class userProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["uid"] != null)
                {
                    loadProfile();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void loadProfile()
        {
            //step 2 - create a connection
            String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
            SqlConnection conn = new SqlConnection(connstr);
            conn.Open();

            String sqlQuery = "SELECT * FROM tblUsers WHERE uid=@uid";

            //step 4 - execute the command
            SqlCommand comm = new SqlCommand(sqlQuery, conn);
            comm.Parameters.AddWithValue("@uid", Session["uid"].ToString());

            //step 5 - manipulate the data
            SqlDataReader reader = comm.ExecuteReader();
            if (reader.Read() == true)
            {
                txtFName.Text = reader["fname"].ToString();
                txtLName.Text = reader["lname"].ToString();
                txtEmail.Text = reader["email"].ToString();
            }
            else
            {
                lblMessage.Text = "record NOT found";
                Response.Redirect("Default.aspx");
            }

            //step 6 - close all connections
            reader.Close();
            conn.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //step 2 - create a connection
            String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
            SqlConnection conn = new SqlConnection(connstr);
            conn.Open();

            String sqlQuery = "UPDATE [tblUsers] SET [FName] = @FName, [LName] = @LName, [Password] = @Password WHERE [UID] = @UID";

            //step 4 - execute the command
            SqlCommand comm = new SqlCommand(sqlQuery, conn);
            comm.Parameters.AddWithValue("@uid", Session["uid"].ToString());
            comm.Parameters.AddWithValue("@FName", txtFName.Text.Trim());
            comm.Parameters.AddWithValue("@LName", txtLName.Text.Trim());
            comm.Parameters.AddWithValue("@Password", txtConfirmPass.Text.Trim());

            //step 5 - insert, update, delete
            int result = comm.ExecuteNonQuery();
            if (result > 0)
            {
                lblMessage.Text = "Profile has been updated";
            }

            //step 6 - close all connections
            conn.Close();
        }
    }
}