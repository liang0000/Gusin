using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Guswin
{
    public partial class ShoppingCatalog : System.Web.UI.Page
    {
        private decimal TotalAmount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dlProduct_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if ((e.CommandName == "addtocart") && (Session["uid"] == null))
            {
                Response.Redirect("login.aspx");
            }

            if ((e.CommandName == "addtocart") && (Session["uid"] != null))
            {
                Label itemPID = e.Item.FindControl("PIDLabel") as Label;
                Label itemName = e.Item.FindControl("pnameLabel") as Label;
                Label itemPrice = e.Item.FindControl("priceLabel") as Label;
                decimal price = decimal.Parse(itemPrice.Text);
                int qty = 1;
                decimal subTotal = qty * price;
                TotalAmount += subTotal;

                String connstr = ConfigurationManager.ConnectionStrings["ConnString2509"].ConnectionString;
                SqlConnection conn = new SqlConnection(connstr);
                conn.Open();
                string sqlQuery = "INSERT INTO tblOrderItem(uid, pid, qty, price, orderDate, status, amount) " +
                    "VALUES(@uid, @pid, @qty, @price, @orderDate, @status, @amount)";
                SqlCommand comm = new SqlCommand(sqlQuery, conn);
                comm.Parameters.AddWithValue("@uid", Session["uid"].ToString());
                comm.Parameters.AddWithValue("@pid", itemPID.Text);
                comm.Parameters.AddWithValue("@qty", qty);
                comm.Parameters.AddWithValue("@price", itemPrice.Text);
                comm.Parameters.AddWithValue("@orderDate", DateTime.Now.ToString());
                comm.Parameters.AddWithValue("@status", "Pending");
                comm.Parameters.AddWithValue("@amount", subTotal);

                int result = comm.ExecuteNonQuery(); //insert, update, delete
                if (result > 0)
                {
                    lblAdded.Text = "Successfully added " + itemName.Text + " to cart!";
                }
                else
                {
                    lblAdded.Text = "Error in adding item to Cart!";
                }
                //comm.ExecuteNonQuery();
                conn.Close();

            }

        }

        protected void repCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "1")
            {
                sqlDSProduct.SelectCommand = "SELECT * FROM [tblProduct] WHERE CID=1";

            } else if (e.CommandName == "2")
            {
                sqlDSProduct.SelectCommand = "SELECT * FROM [tblProduct] WHERE CID=2";

            }else if (e.CommandName == "3")
            {
                sqlDSProduct.SelectCommand = "SELECT * FROM [tblProduct] WHERE CID=3";
            }
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShoppingCatalog.aspx");
        }
    }
}