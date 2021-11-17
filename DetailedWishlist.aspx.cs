using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace Assignment
{
    public partial class DetailedWishlist : System.Web.UI.Page
    {
        // Create connection to database
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string custID;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Detailed Wishlist";
            custID = (string)Session["custID"];

            conn = new SqlConnection(strCon);
            conn.Open();
            String readInfo = "SELECT * FROM Wishlist, ArtWork, Categories, Customer WHERE Customer.custID = @custID AND Wishlist.artID = Artwork.awID AND Artwork.categoryID = Categories.categoryID ORDER BY wishID ASC";

            if (!Page.IsPostBack)
            {
                SqlCommand getData = new SqlCommand(readInfo, conn);
                getData.Parameters.AddWithValue("@custID", custID);

                // Hold data read from database
                SqlDataAdapter sda = new SqlDataAdapter(getData);

                DataTable dt = new DataTable();
                sda.Fill(dt);

                // Assign data source into Repeater1
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

                conn.Close();
            }
        }

        protected void W_Remove_Btn(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            String wishID = (item.FindControl("lblWishID") as Label).Text;

            String cmdDeleteWishlist = "DELETE FROM Wishlist WHERE wishID = @wishID";

            SqlCommand cmdWish = new SqlCommand(cmdDeleteWishlist, conn);
            cmdWish.Parameters.AddWithValue("@wishID", wishID);

            int i = cmdWish.ExecuteNonQuery();

            conn.Close();

            if (i > 0)
            {
                Page.Response.Redirect(Page.Request.Url.ToString(), true);

            }
            else
            {
                Response.Write("<script>alert('Item doesn't deleted')</script>");
            }
        }
    }
}