using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Part_1
{
    public partial class AddNewArtWork : System.Web.UI.Page
    {
        // Create connection to database
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        String artistID;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Add New Artwork";

            // Get current Artist ID
            artistID = (string)Session["AID"];

            // *****Temp code******
            //artistID = "A1001";

        }

        // Clear all user's input
        private void clearAllEnteredData()
        {
            txtArtName.Text = "";
            txtDescription.Text = "";
            txtMaterial.Text = "";
            txtPrice.Text = "";
            ddlCategory.SelectedValue = "Please Select";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearAllEnteredData();
        }

        // Check input field validity
        //private Boolean checkInputValidity()
        //{
        //    String value = txtPrice.Text;

        //    Boolean validity = true;

        //    if (String.IsNullOrEmpty(txtArtName.Text))
        //    {
        //        lblArtNameErrorMsg.Visible = true;
        //        validity = false;
        //    }
        //    if (String.IsNullOrEmpty(txtDescription.Text))
        //    {
        //        lblDescriptionErrorMsg.Visible = true;
        //        validity = false;

        //    }
        //    if(String.IsNullOrEmpty(txtMaterial.Text))
        //    {
        //        lblMaterialErrorMsg.Visible = true;
        //        validity = false;
        //    }
        //    //if(!checkIsDouble(value) || String.IsNullOrEmpty(txtPrice.Text))
        //    //{
        //    //    lblPriceErrorMsg.Visible = true;
        //    //    validity = false;
        //    //}
        //    if(ddlCategory.SelectedValue == "Please Select")
        //    {
        //        lblCategoryErrorMsg.Visible = true;
        //        validity = false;
        //    }
        //    if (fuImage.HasFile == false)
        //    {
        //        lblImageUploadErrorMsg.Visible = true;
        //        validity = false;
        //    }
            

        //    return validity;
        //}

        // Check if user enter a double

        private Boolean checkIsDouble(String value)
        {
            Boolean decimalPoint = false;

            if (value[0].Equals('.'))
            {
                return false;
            }
            
            for(int i = 0; i < value.Length; i++)
            {
                switch (value[i])
                {
                    case '0': continue;
                    case '1': continue;
                    case '2': continue;
                    case '3': continue;
                    case '4': continue;
                    case '5': continue;
                    case '6': continue;
                    case '7': continue;
                    case '8': continue;
                    case '9': continue;
                    case '.':
                        if (decimalPoint == false)
                            decimalPoint = true;
                        else
                            return false;
                        continue;
                    default: return false;
                        
                }
            }

            return true;
            
        }

        // Making the error message invisible again when user press save button for second time
        //private void errorMsgReset()
        //{
        //    lblArtNameErrorMsg.Visible = false;
        //    lblCategoryErrorMsg.Visible = false;
        //    lblDescriptionErrorMsg.Visible = false;
        //    lblMaterialErrorMsg.Visible = false;
        //    lblPriceErrorMsg.Visible = false;
        //    lblImageUploadErrorMsg.Visible = false;
        //}

        // Get categoryID from Categories table
        
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

        // Generate new artwork ID
        private String getawID()
        {
            String getLastAWID = "SELECT TOP 1 awID FROM ArtWork ORDER BY awID DESC";

            SqlCommand cmdGeLastID = new SqlCommand(getLastAWID, conn);

            String awID = (String)cmdGeLastID.ExecuteScalar();

            String extractedID = (String)awID.Substring(2, 6);

            int intID = int.Parse(extractedID);

            intID += 1;

            return "AW" + intID.ToString();

        }

        // Insert new data into databse when user click on save button
        protected void btnSave_Click(object sender, EventArgs e)
        {

            String categoryID = getCategoryID();

            conn = new SqlConnection(strCon);
            conn.Open();

            // query to retrieve data
            //String insertData = "INSERT INTO ArtWork (awID, awDescription, categoryID) VALUES ('AW1001', 'ABC', 1001)";
            String insertData = "INSERT INTO ArtWork(awID, awName, materialUsed, awPrice, awDescription, awImage, stockQty, categoryID, artistID) VALUES(@id, @name, @materialUsed, @price, @description, @image, @qty, @CID, @AID)";
                

            SqlCommand cmdInsert = new SqlCommand(insertData, conn);

            // Define data for '@' parameter
            cmdInsert.Parameters.AddWithValue("@id", getawID());
            cmdInsert.Parameters.AddWithValue("@name", txtArtName.Text);
            cmdInsert.Parameters.AddWithValue("@materialUsed", txtMaterial.Text);
            cmdInsert.Parameters.AddWithValue("@price", Convert.ToDouble(txtPrice.Text));
            cmdInsert.Parameters.AddWithValue("@description", txtDescription.Text);
            cmdInsert.Parameters.AddWithValue("@image", fuImage.FileBytes);
            cmdInsert.Parameters.AddWithValue("@qty", 0);
            cmdInsert.Parameters.AddWithValue("@CID", categoryID);
            cmdInsert.Parameters.AddWithValue("@AID", artistID);
                

            int i = cmdInsert.ExecuteNonQuery();

            if(i > 0)
            {
                Response.Write("<script>alert('One ArtWork Added')</script>");    
            }
            else
            {
                Response.Write("<script>alert('Item doesn't added')</script>");
            }

            conn.Close();

            clearAllEnteredData();

           

        }

        protected void txtPrice_TextChanged(object sender, EventArgs e)
        {

        }

    }
}