using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Part_1
{
    public partial class ArtWorkDetails : System.Web.UI.Page
    {
        // Create connection to database
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Artwork Details";

            String awID = Request.QueryString["AWID"];

            conn = new SqlConnection(strCon);
            conn.Open();
            String readAWDetails = "SELECT * FROM Artwork, Categories WHERE ArtWork.awID = @id";
            String readImage = "SELECT awImage FROM ArtWork WHERE awID = @id";

            SqlCommand getData = new SqlCommand(readAWDetails, conn);
            SqlCommand getImage = new SqlCommand(readImage, conn);

            getImage.Parameters.AddWithValue("@id", awID);
            byte[] bytes = (byte[])getImage.ExecuteScalar();

            getData.Parameters.AddWithValue("@id", awID.ToString());
            SqlDataReader dtr = getData.ExecuteReader();


            // Check if has row read from databse

            if (dtr.Read())
            {
                String strBase64 = Convert.ToBase64String(bytes);
                AWImage.ImageUrl = "data:Image/png;base64," + strBase64;

                name.Text = dtr.GetString(dtr.GetOrdinal("awName"));

                category.Text = dtr.GetString(dtr.GetOrdinal("categoryName"));

                price.Text = Math.Round(decimal.Parse(dtr["awPrice"].ToString()), 2).ToString();

                MaterialUsed.Text = dtr.GetString(dtr.GetOrdinal("materialUsed"));
                Description.Text = dtr.GetString(dtr.GetOrdinal("awDescription"));
            }
            else
            {
                Response.Write("<script>alert('Details not found!')</script>");
            }

            conn.Close();
        }
        
    }
}