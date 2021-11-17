using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace part1
{
    public partial class SignupArtist : System.Web.UI.Page
    {
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        String latestArtistID;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(strCon);
            conn.Open();
            SqlCommand cmdSelectArtistID = new SqlCommand("Select TOP 1 artistID from Artist ORDER BY artistID DESC", conn);
            latestArtistID = (string)cmdSelectArtistID.ExecuteScalar();
        }

        protected void conSignupBtn_Click(object sender, EventArgs e)
        {
            String cmd = "Update Artist SET artistName = @artistName, artistGender = @artistGender, artistPhoneNo = @artistPhoneNo WHERE artistID = @artistID";

            SqlCommand cmdArtist = new SqlCommand(cmd, conn);

            cmdArtist.Parameters.AddWithValue("@artistID", latestArtistID);
            cmdArtist.Parameters.AddWithValue("@artistName", txtArtistName.Text);
            cmdArtist.Parameters.AddWithValue("@artistPhoneNo", txtArtistPhone.Text);

            if(rblArtistGender.SelectedValue == "Male")
            {
                String artistGender = "Male";
                cmdArtist.Parameters.AddWithValue("@artistGender", artistGender);
            }
            else
            {
                String artistGender = "Female";
                cmdArtist.Parameters.AddWithValue("@artistGender", artistGender);
            }
                
            int i = cmdArtist.ExecuteNonQuery();

            conn.Close();

            Response.Redirect("Login.aspx");
        }
    }
}