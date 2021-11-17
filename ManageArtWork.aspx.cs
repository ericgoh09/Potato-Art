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
    public partial class ManageArtWork : System.Web.UI.Page
    {
        // Create connection to database
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        string artistID;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Artwork Management";
            artistID = (string)Session["AID"];

            if (!IsPostBack)
            {

                Boolean dataDisplayed = false;

                conn = new SqlConnection(strCon);
                conn.Open();
                String readImage = "SELECT * FROM ArtWork, Categories WHERE ArtWork.artistID = @AID AND ArtWork.categoryID = Categories.categoryID";

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

                dataDisplayed = true;
            }

            
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           
        }

        // Pass artwork name into MangeStock.aspx when user click on "Manage Stock" button
        protected void StockIn(object sender, EventArgs e)
        {
            //RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            string awID = (item.FindControl("lblAWID") as Label).Text;

            Response.Redirect("ManageStock.aspx?ID=" + awID);
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        // Code to delete artwork from list
        protected void deleteStock(object sender, EventArgs e)
        {
            //RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            RepeaterItem item = (sender as ImageButton).NamingContainer as RepeaterItem;

            string awID = (item.FindControl("lblAWID") as Label).Text;

            // Open SQL connection
            conn = new SqlConnection(strCon);
            conn.Open();

            // Query to read artwork details
            String deleteArtWork = "DELETE FROM ArtWork WHERE awID = @awID";


            // Set up SQL command
            SqlCommand deleteData = new SqlCommand(deleteArtWork, conn);

            // Define value for awID
            deleteData.Parameters.AddWithValue("@awID", awID);


            int i = deleteData.ExecuteNonQuery();

            if (i > 0)
            {
                Page.Response.Redirect(Page.Request.Url.ToString(), true);

            }
            else
            {
                Response.Write("<script>alert('Item doesn't deleted')</script>");
            }

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

        // Pass artwork name into MangeStock.aspx when user click on "Manage Stock" button
        protected void editBtn(object sender, EventArgs e)
        {
            // RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            RepeaterItem item = (sender as ImageButton).NamingContainer as RepeaterItem;

            string awID = (item.FindControl("lblAWID") as Label).Text;

            Response.Redirect("EditArtWork.aspx?ID=" + awID);


        }

    }
}