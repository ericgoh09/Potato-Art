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
    public partial class NewArtWorkDetails : System.Web.UI.Page
    {
        
        // Create connection to database
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        String artistID;

        protected void Page_Load(object sender, EventArgs e)
        {


            //artistID = Request.QueryString["ID"];

            artistID = (string)Session["AID"];

            // *****Temp code******
            //artistID = "A1001";

            Page.Title = "My Gallery";

            conn = new SqlConnection(strCon);
            conn.Open();
            String readImage = "SELECT * FROM ArtWork, Categories WHERE ArtWork.artistID = @AID AND ArtWork.categoryID = Categories.categoryID";
            //String readImage = "SELECT * FROM ArtWork, Categories WHERE ArtWork.artistID = ArtWork.categoryID = Categories.categoryID";

            SqlCommand getData = new SqlCommand(readImage, conn);
            getData.Parameters.AddWithValue("@AID", artistID);

            // Hold data read from database
            SqlDataAdapter sda = new SqlDataAdapter(getData);

            DataTable dt = new DataTable();
            sda.Fill(dt);

            // Assign data source into Repeater1
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            // Close database connection
            conn.Close();

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
        }

        protected void serachBtn_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;

            string userInput = txtSearch.Text;

            userInput = userInput.ToUpper();

            conn = new SqlConnection(strCon);
            conn.Open();

            String searchName = "SELECT * FROM ArtWork, Categories WHERE ArtWork.artistID = @AID AND ArtWork.categoryID = Categories.categoryID AND UPPER(awName) LIKE '%" + userInput + "%' ";
            //String readImage = "SELECT * FROM ArtWork, Categories WHERE ArtWork.artistID = ArtWork.categoryID = Categories.categoryID";

            SqlCommand searchData = new SqlCommand(searchName, conn);
            searchData.Parameters.AddWithValue("@AID", artistID);

            // Hold data read from database
            SqlDataAdapter sda = new SqlDataAdapter(searchData);

            DataTable dt = new DataTable();
            sda.Fill(dt);

            // Assign data source into Repeater1
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            if (!(dt.Rows.Count > 0))
            {
                Label1.Visible = true;
            }
            

            // Close database connection
            conn.Close();
        }
    }
}