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
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["uid"] != null)
                {
                    LoadShoppingList();
                    loadTotalAmount();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        private void LoadShoppingList()
        {
            String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
            SqlConnection conn = new SqlConnection(connstr);
            conn.Open();

            String sqlQuery = "SELECT oi.OrderID, oi.UID, p.PID, p.pname, p.pdescription, p.pImage, p.price, oi.QTY, oi.amount " +
                "FROM tblOrderItem oi, tblProduct p " +
                "WHERE oi.PID = p.PID AND oi.UID = @uid AND oi.status = 'Pending'";

            SqlCommand comm = new SqlCommand(sqlQuery, conn);
            comm.Parameters.AddWithValue("@uid", Session["uid"].ToString());
            ListView1.DataSource = comm.ExecuteReader();
            ListView1.DataBind();
        }

        private void loadTotalAmount()
        {
            String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
            SqlConnection conn = new SqlConnection(connstr);
            conn.Open();

            String sqlQuery = "SELECT sum(amount) as totalAmount FROM tblOrderItem WHERE uid = @uid";

            SqlCommand comm = new SqlCommand(sqlQuery, conn);
            comm.Parameters.AddWithValue("@uid", Session["uid"].ToString());
            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read() == true)
            {
                lblTotalAmount.Text = reader["totalAmount"].ToString();
            }
        }

        protected void btnConShop_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShoppingCatalog.aspx");
        }

        protected void ListView1_ItemCommand(object source, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                Label orderID = e.Item.FindControl("OrderIDLabel") as Label;

                String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
                SqlConnection conn = new SqlConnection(connstr);
                conn.Open();

                String sqlQuery = "DELETE FROM [tblOrderItem] WHERE [OrderID] = @OrderID";
                SqlCommand comm = new SqlCommand(sqlQuery, conn);
                comm.Parameters.AddWithValue("@OrderID", orderID.Text);

                
                comm.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("ShoppingCart.aspx");
            }
            
            if (e.CommandName == "update")
            {
                Label orderID = e.Item.FindControl("OrderIDLabel") as Label;
                Label itemPrice = e.Item.FindControl("priceLabel") as Label;
                int price = int.Parse(itemPrice.Text);
                Label itemQTY = e.Item.FindControl("txtQTY") as Label;
                int qty = int.Parse(itemQTY.Text);
                int amount = qty * price;


                String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
                SqlConnection conn = new SqlConnection(connstr);
                conn.Open();

                String sqlQuery = "UPDATE [tblOrderItem] SET [QTY] = @QTY, [amount] = @amount WHERE [OrderID] = @OrderID";
                SqlCommand comm = new SqlCommand(sqlQuery, conn);
                comm.Parameters.AddWithValue("@OrderID", orderID.Text);
                comm.Parameters.AddWithValue("@QTY", itemQTY.Text);
                comm.Parameters.AddWithValue("@amount", amount);


                comm.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("ShoppingCart.aspx");
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
            SqlConnection conn = new SqlConnection(connstr);
            conn.Open();

            String sqlQuery = "UPDATE [tblOrderItem] SET [totalAmount] = @totalAmount WHERE [uid] = @uid";
            SqlCommand comm = new SqlCommand(sqlQuery, conn);
            comm.Parameters.AddWithValue("@uid", Session["uid"]);
            comm.Parameters.AddWithValue("@totalAmount", lblTotalAmount.Text);
            comm.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Payment.aspx");
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {

        }
    }
}