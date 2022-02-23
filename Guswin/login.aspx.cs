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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            //step 2 - create a connection
            String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
            SqlConnection conn = new SqlConnection(connstr);
            conn.Open();

            //step 3 - create a command - SELECT, DELETE, INSERT, UPDATE
            String sqlQuery = "SELECT * FROM tblUsers WHERE email=@email AND password=@password";

            //step 4 - execute the command
            SqlCommand comm = new SqlCommand(sqlQuery, conn);
            comm.Parameters.AddWithValue("@email", txtEmail.Text.Trim()); //trim is to remove spaces
            comm.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

            //step 5 - manipulate the data
            SqlDataReader reader = comm.ExecuteReader();
            if (reader.Read() == true)
            {
                if (txtPosition.Text == "tengworks")
                {
                    Session["admin"] = "tengworks";
                }

                Session["uid"] = reader["uid"].ToString();
                Session["email"] = reader["email"].ToString();
                Session["username"] = reader["fname"].ToString() + " " + reader["lname"].ToString();
                Session["fname"] = reader["fname"].ToString();
                Session["lname"] = reader["lname"].ToString();
                lblMessage.Text = "Login Successful";
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.Text = "User info not found. Please enter correct Email & Password";
            }

            //step 6 - close all connections
            reader.Close();
            conn.Close();
        }
    }
}