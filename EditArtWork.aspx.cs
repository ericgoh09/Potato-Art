using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Assignment
{
    public partial class EditArtWork : System.Web.UI.Page
    {
        
        // Create connection to database
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        String awID;
        protected void Page_Load(object sender, EventArgs e)
        {
            awID = Request.QueryString["ID"];

            if (!Page.IsPostBack)
            {
                Page.Title = "Edit Artwork";

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
                    txtArtName.Text = dtr.GetString(dtr.GetOrdinal("awName"));

                    ddlCategory.SelectedValue = getCategoryName(dtr.GetString(dtr.GetOrdinal("categoryID")));

                    txtMaterial.Text = dtr.GetString(dtr.GetOrdinal("categoryName"));

                    txtPrice.Text = Math.Round(decimal.Parse(dtr["awPrice"].ToString()), 2).ToString();

                    txtDescription.Text = dtr.GetString(dtr.GetOrdinal("awDescription"));

                    //String strBase64 = Convert.ToBase64String(bytes);

                    //AWImage.ImageUrl = "data:Image/png;base64," + strBase64;

                    //name.Text = dtr.GetString(dtr.GetOrdinal("awName"));

                    //category.Text = dtr.GetString(dtr.GetOrdinal("categoryName"));

                    //price.Text = Math.Round(decimal.Parse(dtr["awPrice"].ToString()), 2).ToString();

                    //MaterialUsed.Text = dtr.GetString(dtr.GetOrdinal("materialUsed"));
                    //Description.Text = dtr.GetString(dtr.GetOrdinal("awDescription"));
                }
                else
                {
                    Response.Write("<script>alert('Details not found!')</script>");
                }

                conn.Close();
            }
            
        }

        protected void txtDescription_TextChanged(object sender, EventArgs e)
        {

        }

        private String getCategoryName(String categoryID)
        {
            if (categoryID.Contains("CT1001"))
                return "Drawing";
            else if (categoryID.Contains("CT1002"))
                return "Modeling";
            else if (categoryID.Contains("CT1003"))
                return "Music";
            else if (categoryID.Contains("CT1004"))
                return "Painting";
            else if (categoryID.Contains("CT1005"))
                return "Photographing";
            else if (categoryID.Contains("CT1006"))
                return "Sculpture";
            else
                return "Others";

        }

        private String getCategoryID()
        {
            if (ddlCategory.SelectedValue == "Drawing")
                return "CT1001";
            else if (ddlCategory.SelectedValue == "Modeling")
                return "CT1002";
            else if (ddlCategory.SelectedValue == "Music")
                return "CT1003";
            else if (ddlCategory.SelectedValue == "Painting")
                return "CT1004";
            else if (ddlCategory.SelectedValue == "Photographing")
                return "CT1005";
            else if (ddlCategory.SelectedValue == "Sculpture")
                return "CT1006";
            else
                return "CT1007";

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageArtWork.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(strCon);
            conn.Open();

            // Use to indicate whether the data is updated successfully
            int success;

            if(!(fuImage.HasFile))
            {
                String updateAWDetails = "UPDATE ArtWork SET awName = @name, awPrice = @price, awDescription = @description, categoryID = @categoryID, materialUsed = @materialUsed WHERE awID = @id";

                SqlCommand updateArtWork = new SqlCommand(updateAWDetails, conn);

                updateArtWork.Parameters.AddWithValue("@id", awID.ToString());
                updateArtWork.Parameters.AddWithValue("@name", txtArtName.Text);
                updateArtWork.Parameters.AddWithValue("@price", Convert.ToDouble(txtPrice.Text));
                updateArtWork.Parameters.AddWithValue("@description", txtDescription.Text);
                updateArtWork.Parameters.AddWithValue("@categoryID", getCategoryID());
                updateArtWork.Parameters.AddWithValue("@materialUsed", txtMaterial.Text);

                success = updateArtWork.ExecuteNonQuery();
            }
            else
            {
                String updateAWDetails = "UPDATE ArtWork SET awName = @name, awPrice = @price, awDescription = @description, categoryID = @categoryID, materialUsed = @materialUsed, awImage = @image WHERE awID = @awID";

                SqlCommand updateArtWork = new SqlCommand(updateAWDetails, conn);

                updateArtWork.Parameters.AddWithValue("@awID", awID);
                updateArtWork.Parameters.AddWithValue("@name", txtArtName.Text);
                updateArtWork.Parameters.AddWithValue("@price", Convert.ToDouble(txtPrice.Text));
                updateArtWork.Parameters.AddWithValue("@description", txtDescription.Text);
                updateArtWork.Parameters.AddWithValue("@categoryID", getCategoryID());
                updateArtWork.Parameters.AddWithValue("@materialUsed", txtMaterial.Text);
                updateArtWork.Parameters.AddWithValue("@image", fuImage.FileBytes);


                success = updateArtWork.ExecuteNonQuery();

                
            }

            if (success > 0)
            {
                Response.Write("<script>alert('ArtWork Details Updated')</script>");

            }
            else
            {
                Response.Write("<script>alert('Item Doesn't Updated!')</script>");
            }

            conn.Close();

            Response.Redirect("ManageArtWork.aspx");

        }
    }
}