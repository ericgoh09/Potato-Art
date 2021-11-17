using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class payment : System.Web.UI.Page
    {

        SqlConnection con;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        int countPayment;
        int noOfHistory;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string order_id = Request.QueryString["orderID"];
                lbltotalPrice.Text = Request.QueryString["totalPrice"];
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
                valid_until_year();
            }
        }
        protected void btnPay_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            }
            else
            {
                string script = "alert('Pay Successfully');";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script, true);
                con = new SqlConnection(strCon);
                con.Open();
                SqlCommand cmdCheckCount = new SqlCommand("select count(*) from payment", con);
                countPayment = (int)cmdCheckCount.ExecuteScalar();

                SqlCommand cmd = new SqlCommand("insert into payment values (@paymentID, @custID, @orderID, @paymentDate, @totalPrice)", con);
                string payment_id = getPaymentID();
                string order_id = Request.QueryString["orderID"];
                string totalPrice = Request.QueryString["totalPrice"];
                cmd.Parameters.AddWithValue("@paymentID", getPaymentID());

                String custID = Session["custID"].ToString();

                cmd.Parameters.AddWithValue("@custID", custID);
                cmd.Parameters.AddWithValue("@orderID", order_id);
                cmd.Parameters.AddWithValue("@paymentDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@totalPrice", totalPrice);
                int i = cmd.ExecuteNonQuery();

                SqlCommand cmdSelectAwID = new SqlCommand("select ArtWork.awID FROM orders INNER JOIN OrderDetail ON orders.orderID = OrderDetail.orderID INNER JOIN ArtWork ON OrderDetail.awID = ArtWork.awID where orders.orderID = '" + order_id + "'", con);
                string awID_update = (string)cmdSelectAwID.ExecuteScalar();
                SqlCommand cmdSelectQty = new SqlCommand("select OrderDetail.qty FROM orders INNER JOIN OrderDetail ON orders.orderID = OrderDetail.orderID where orders.orderID = '" + order_id + "'", con);
                int qty = (int)cmdSelectQty.ExecuteScalar();
                SqlCommand cmdUpdate = new SqlCommand("update artwork set stockQty = stockQty - " + qty + " where awID = '" + awID_update + "'", con);
                SqlDataReader rd2 = cmdUpdate.ExecuteReader();
                con.Close();
                con.Open();

                SqlCommand command = new SqlCommand("select * FROM payment INNER JOIN orders ON payment.orderID = orders.orderID INNER JOIN OrderDetail ON orders.orderID = OrderDetail.orderID INNER JOIN ArtWork ON OrderDetail.awID = ArtWork.awID where paymentID = '" + payment_id + "'", con);
                int result = command.ExecuteNonQuery();

                SqlDataReader reader = command.ExecuteReader();
                string email = "";
                while (reader.Read())
                {
                    email = "Payment ID: " + reader["paymentID"].ToString() +
                        "\nCustomer ID: " + reader["custID"].ToString() +
                        "\nPayment Date: " + reader["paymentDate"].ToString() +
                        "\nOrder ID: " + reader["orderID"].ToString() +
                        "\nawtWork ID: " + reader["awID"].ToString() +
                        "\nawtWork Name: " + reader["awName"].ToString() +
                        "\nQuantity: " + reader["qty"].ToString() +
                        "\nUnit Price: " + String.Format("{0:N2}", reader["unitPrice"]) +
                        "\nTotal Price: " + String.Format("{0:N2}", reader["totalPrice"]);
                }
                con.Close();

                try
                {
                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    client.EnableSsl = true;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("weihao3110@gmail.com", "leowweihao3110");
                    MailMessage msgobj = new MailMessage();
                    msgobj.To.Add("weihao3110@gmail.com");
                    msgobj.From = new MailAddress("weihao3110@gmail.com");
                    msgobj.Subject = "Resit of artWork";
                    msgobj.Body = email;
                    client.Send(msgobj);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Message has been sent successfully');location.href='homepage.aspx'", true);

                }
                catch (Exception ex)
                {
                    Response.Write("Couldnot send email" + ex.Message);
                }
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(strCon);
            string order_id = Request.QueryString["orderID"];
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM orderdetail WHERE orderID = '" + order_id + "'", con);
            SqlCommand cmd1 = new SqlCommand("DELETE FROM orders WHERE orderID = '" + order_id + "'", con);
            int i = cmd.ExecuteNonQuery();
            i = cmd1.ExecuteNonQuery();
            con.Close();
            Response.Redirect("order.aspx");
        }

        private string getHistoryID()
        {
            con.Open();

            int tempHistory;
            String tempHistoryID;
            String lastHistoryID = "";
            String cmdCheckLastID = "SELECT TOP 1 historyID FROM History ORDER BY historyID DESC";

            SqlCommand cmdWID = new SqlCommand(cmdCheckLastID, con);
            int i = cmdWID.ExecuteNonQuery();

            using (SqlDataReader reader = cmdWID.ExecuteReader())
            {
                if (reader.Read())
                {
                    lastHistoryID = (String)reader["historyID"];
                }
            }

            noOfHistory += 1;
            tempHistory = noOfHistory + 1000;
            tempHistoryID = String.Concat('W', tempHistory.ToString());
            tempHistoryID = String.Concat(tempHistoryID, "     ");

            while (tempHistoryID.Equals(lastHistoryID))
            {
                noOfHistory += 1;
                tempHistory = noOfHistory + 1000;
                tempHistoryID = String.Concat('W', tempHistory.ToString());
            }

            con.Close();

            return tempHistoryID;   
        }

        private string getPaymentID()
        {
            countPayment += 1;
            int temp = countPayment + 1000;
            return "P" + temp.ToString();
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtAccName.Text = "";
            txtAccNo.Text = "";
        }
        protected void valid_until_year()
        {
            int year = DateTime.Now.Year;
            for (int i = 0; i < 10; i++)
            {
                string item = Convert.ToString(year + i);
                ddlYear.Items.Add(item);
            }
        }
    }
}