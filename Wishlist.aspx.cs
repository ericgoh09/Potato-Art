using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class Wishlist : System.Web.UI.Page
    {
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        int noOfWish;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }

            conn = new SqlConnection(strCon);

            conn.Open();

            SqlCommand cmdCountTotalArtist = new SqlCommand("Select COUNT(*) From Wishlist", conn);
            noOfWish = (int)cmdCountTotalArtist.ExecuteScalar();

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void W_RemoveAll_Btn(object sender, EventArgs e)
        {
            String cmdDeleteWishlist = "DELETE FROM Wishlist";

            SqlCommand cmdWish = new SqlCommand(cmdDeleteWishlist, conn);

            cmdWish.ExecuteNonQuery();

            lblMsg.Text = "Record deleted succesfully";

            conn.Close();

            Response.Redirect("~/Wishlist.aspx");
        }
    }
}