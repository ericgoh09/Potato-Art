using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace part_1
{
    public partial class Signup : System.Web.UI.Page
    {
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int noOfArtist;
        int noOfCust;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(strCon);
            conn.Open();

            SqlCommand cmdCountTotalArtist = new SqlCommand("Select COUNT(*) From Artist", conn);
            noOfArtist = (int)cmdCountTotalArtist.ExecuteScalar();

            SqlCommand cmdCountTotalCust = new SqlCommand("Select COUNT(*) From Customer", conn);
            noOfCust = (int)cmdCountTotalCust.ExecuteScalar();
        }

        protected void signupBtn_Click(object sender, EventArgs e)
        {
            if (ddlSignupUser.SelectedValue == "ArtistAcc")
            {
                String cmdInsertArtist = "insert into Artist (artistID, artistEmail, artistPassword) values (@artistID, @artistEmail, @artistPassword)";

                SqlCommand cmdArtist = new SqlCommand(cmdInsertArtist, conn);

                cmdArtist.Parameters.AddWithValue("@artistID", getArtistID());
                cmdArtist.Parameters.AddWithValue("@artistEmail", txtSignupEmail.Text);
                cmdArtist.Parameters.AddWithValue("@artistPassword", txtSignupPassword.Text);
                int i = cmdArtist.ExecuteNonQuery();

                conn.Close();

                Response.Redirect("SignupArtist.aspx");
            }

            else //CustomerAcc
            {
                String cmdInsertCust = "insert into Customer (custID, custEmail, custPassword) values (@custID, @custEmail, @custPassword)";

                SqlCommand cmdCust = new SqlCommand(cmdInsertCust, conn);

                cmdCust.Parameters.AddWithValue("@custID", getCustID());
                cmdCust.Parameters.AddWithValue("@custEmail", txtSignupEmail.Text);
                cmdCust.Parameters.AddWithValue("@custPassword", txtSignupPassword.Text);
                int i = cmdCust.ExecuteNonQuery();

                conn.Close();

                Response.Redirect("SignupCust.aspx");
            }
        }

        private String getArtistID()
        {
            noOfArtist += 1;
            int tempArtist = noOfArtist + 1000;
            return "A" + tempArtist.ToString();
        }

        private String getCustID()
        {
            noOfCust += 1;
            int tempCust = noOfCust + 1000;
            return "C" + tempCust.ToString();
        }
    }
}
