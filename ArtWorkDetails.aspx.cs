using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class ArtWorkDetails : System.Web.UI.Page
    {
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        int noOfWish;

        protected void Page_Load(object sender, EventArgs e)
        {
            String awID = Request.QueryString["awid"];
            lblawID.Text = awID;

            conn = new SqlConnection(strCon);
            conn.Open();

            SqlCommand cmdCountTotalArtist = new SqlCommand("Select COUNT(*) From Wishlist", conn);
            noOfWish = (int)cmdCountTotalArtist.ExecuteScalar();
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            Session["awID"] = lblawID.Text;
            String cmdInsertArtist = "insert into Wishlist (wishID, artID, CID) values (@wishID, @artID, @CID)";

            String custID = Session["custID"].ToString();
            int i;

            SqlCommand cmdArtist = new SqlCommand(cmdInsertArtist, conn);

            cmdArtist.Parameters.AddWithValue("@wishID", getWishID());
            cmdArtist.Parameters.AddWithValue("@artID", lblawID.Text);
            cmdArtist.Parameters.AddWithValue("@CID", custID);

            i = cmdArtist.ExecuteNonQuery();

            conn.Close();
            
            string script = "alert('Inserted Wistlist Successfully');";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script, true);
        }

        private String getWishID()
        {
            int tempWish;
            String tempWishID;
            String lastWishID = "";
            String cmdCheckLastID = "SELECT TOP 1 wishID FROM Wishlist ORDER BY wishID DESC";

            SqlCommand cmdWID = new SqlCommand(cmdCheckLastID, conn);
            int i = cmdWID.ExecuteNonQuery();

            using (SqlDataReader reader = cmdWID.ExecuteReader())
            {
                if (reader.Read())
                {
                    lastWishID = (String)reader["wishID"];
                }
            }

            noOfWish += 1;
            tempWish = noOfWish + 1000;
            tempWishID = String.Concat('W', tempWish.ToString());
            tempWishID = String.Concat(tempWishID, "     ");

            while (tempWishID.Equals(lastWishID))
            {
                noOfWish += 1;
                tempWish = noOfWish + 1000;
                tempWishID = String.Concat('W', tempWish.ToString());

            }

            return tempWishID;
        }

        protected void BtnOrder_Click(object sender, EventArgs e)
        {
            Session["artID"] = lblawID.Text;

            Response.Redirect("order.aspx");
        }
    }
}