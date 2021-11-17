using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Profile : System.Web.UI.Page
    {
        // Create connection to database
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        String artistID;
        protected void Page_Load(object sender, EventArgs e)
        {
            artistID = (string)Session["AID"];

            if (!Page.IsPostBack)
            {
                Page.Title = "Edit Artist";

                conn = new SqlConnection(strCon);
                conn.Open();
                String readArtistDetails = "SELECT * FROM Artist WHERE Artist.artistID = @id";
                String readImage = "SELECT artistImage FROM Artist WHERE artistID = @id";

                SqlCommand getData = new SqlCommand(readArtistDetails, conn);
                SqlCommand getImage = new SqlCommand(readImage, conn);


                getData.Parameters.AddWithValue("@id", artistID.ToString());
                SqlDataReader dtr = getData.ExecuteReader();

                // Check if has row read from databse

                if (dtr.Read())
                {
                    lblID.Text = dtr.GetString(dtr.GetOrdinal("artistID"));

                    lblEmail.Text = dtr.GetString(dtr.GetOrdinal("artistEmail"));

                    lblGender.Text = dtr.GetString(dtr.GetOrdinal("artistGender"));

                    txtProfileName.Text = dtr.GetString(dtr.GetOrdinal("artistName"));

                    txtArtistPhone.Text = dtr.GetString(dtr.GetOrdinal("artistPhoneNo"));

                    txtProfileDesc.Text = dtr.GetString(dtr.GetOrdinal("artistDescription"));

                    try
                    {
                        getImage.Parameters.AddWithValue("@id", artistID);
                        byte[] bytes = (byte[])getImage.ExecuteScalar();

                        String strBase64 = Convert.ToBase64String(bytes);
                        ArtistImage.ImageUrl = "data:Image/png;base64," + strBase64;
                    }
                    catch
                    {

                    }
                }
                else
                {
                    Response.Write("<script>alert('Details not found!')</script>");
                }

                conn.Close();
            }

        }
        protected void saveBtn_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(strCon);
            conn.Open();

            // Use to indicate whether the data is updated successfully
            int success;

            if (!(fuImage.HasFile))
            {
                String updateArtistDetails = "UPDATE Artist SET artistName = @name, artistPhoneNo = @phoneNo, artistDescription = @description WHERE artistID = @id";

                SqlCommand updateArtistWork = new SqlCommand(updateArtistDetails, conn);

                updateArtistWork.Parameters.AddWithValue("@id", artistID.ToString());
                updateArtistWork.Parameters.AddWithValue("@name", txtProfileName.Text);
                updateArtistWork.Parameters.AddWithValue("@phoneNo", txtArtistPhone.Text);
                updateArtistWork.Parameters.AddWithValue("@description", txtProfileDesc.Text);

                success = updateArtistWork.ExecuteNonQuery();
            }
            else
            {
                String updateArtistDetails = "UPDATE Artist SET artistName = @name, artistPhoneNo = @phoneNo, artistDescription = @description, artistImage = @image WHERE artistID = @id";

                SqlCommand updateArtistWork = new SqlCommand(updateArtistDetails, conn);

                updateArtistWork.Parameters.AddWithValue("@id", artistID.ToString());
                updateArtistWork.Parameters.AddWithValue("@name", txtProfileName.Text);
                updateArtistWork.Parameters.AddWithValue("@phoneNo", txtArtistPhone.Text);
                updateArtistWork.Parameters.AddWithValue("@description", txtProfileDesc.Text);
                updateArtistWork.Parameters.AddWithValue("@image", fuImage.FileBytes);

                success = updateArtistWork.ExecuteNonQuery();
            }

            if (success > 0)
            {
                Response.Write("<script>alert('Artist Details Updated')</script>");

            }
            else
            {
                Response.Write("<script>alert('Item Doesn't Updated!')</script>");
            }

            conn.Close();

            Response.Redirect("Profile.aspx");
        }

        protected void ChangePassword1_ChangedPassword(object sender, EventArgs e)
        {

        }
    }
}