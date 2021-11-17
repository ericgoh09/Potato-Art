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
    public partial class ManaageStock : System.Web.UI.Page
    {
        // Create connection to database
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        int currentQty;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Manage Stock";

            // Get Artwork name from previous page
            string awID = getAWID();
            string tempStockQty;

            // Open SQL connection
            conn = new SqlConnection(strCon);
            conn.Open();

            // Query to read artwork details
            String readAWDetails = "SELECT * FROM Artwork WHERE ArtWork.awID = @awID";
            String readImage = "SELECT awImage FROM ArtWork WHERE awID = @awID";

            // Set up SQL command
            SqlCommand getData = new SqlCommand(readAWDetails, conn);
            SqlCommand getImage = new SqlCommand(readImage, conn);

            // Read image from databse
            getImage.Parameters.AddWithValue("@awID", awID);
            byte[] bytes = (byte[])getImage.ExecuteScalar();

            // Read artwork details from databse
            getData.Parameters.AddWithValue("@awID", awID.ToString());
            SqlDataReader dtr = getData.ExecuteReader();

            // Check if has row
            if (dtr.Read())
            {
                // Convert image from binary to the correct format to be displayed on screen
                String strBase64 = Convert.ToBase64String(bytes);
                AWImage.ImageUrl = "data:Image/png;base64," + strBase64;

                // Diisplay artwork details
                name.Text = dtr.GetString(dtr.GetOrdinal("awName"));

                tempStockQty = dtr["stockQty"].ToString();

                currentQty = Int32.Parse(tempStockQty);

                qty.Text = tempStockQty;
            }
            else
            {
                // Prompt when artwork details cannot read from database
                Response.Write("<script>alert('Details not found!')</script>");
            }

            conn.Close();
        }

        // Function to get artwork name from previous page
        private string getAWID()
        {
            return Request.QueryString["ID"];
        }

        protected void txtQty_TextChanged(object sender, EventArgs e)
        {

        }

        // Check if user enter is digit
        private Boolean isDigit(String value)
        {
            //for(int i = 0; i < value.Length; i++)
            //{

            //    switch (value[i])
            //    {
            //        case '0':
            //            dispInputLessThanZeroErrorMsg();
            //            return false;
            //        case '1': continue;
            //        case '2': continue;
            //        case '3': continue;
            //        case '4': continue;
            //        case '5': continue;
            //        case '6': continue;
            //        case '7': continue;
            //        case '8': continue;
            //        case '9': continue;
            //        default:
            //            dispNonDigitErrorMsg();
            //            return false;
            //    }
            //}

            try
            {
                int digit = int.Parse(value);
                return true;

            }
            catch
            {
                dispNonDigitErrorMsg();
                return false;
            }
            
        }

        // Displayed when user enter non digit input
        private void dispNonDigitErrorMsg()
        {
            lblErrorMsg.Visible = true;
            lblErrorMsg.Text = "Please enter a digit!!!";
        }

        // Displayed when user enter a digit less than zero
        private void dispInputLessThanZeroErrorMsg()
        {
            lblErrorMsg.Visible = true;
            lblErrorMsg.Text = "Digit entered must greater than 0";
        }

        protected Boolean isPositive(String value)
        {
            int digit = int.Parse(value);

            if(digit <= 0)
            {
                dispInputLessThanZeroErrorMsg();
                return false;
            }

            return true;
           
        }

        // Check if the data entered by user is valid
        private Boolean checkValidity()
        {
            if (string.IsNullOrEmpty(txtQty.Text))
            {
                lblErrorMsg.Visible = true;
                lblErrorMsg.Text = "Please enter a digit!!!";
                return false;
            }
            if (!isDigit(txtQty.Text))
            {
                return false;
            }
            if (!isPositive(txtQty.Text))
            {
                return false;
            }

            return true;

        }

        // Perform stock in operation
        protected void btnStockIn_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Visible = false;

            if (checkValidity())
            {
                
                int updatedStockQty = currentQty + Int32.Parse(txtQty.Text);

                conn = new SqlConnection(strCon);
                conn.Open();

                String addStockQty = "UPDATE ArtWork SET stockQty = @qty WHERE awID = @awID";

                SqlCommand updateStock = new SqlCommand(addStockQty, conn);
                updateStock.Parameters.AddWithValue("@awID", getAWID());
                updateStock.Parameters.AddWithValue("@qty", updatedStockQty);

                int i = updateStock.ExecuteNonQuery();

                // Check if stockQty updated successfully
                if (i > 0)
                {
                    lblSucessMsg.Visible = true;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    
                }
                else
                {
                    Response.Write("<script>alert('Fail to update stock quantity!')</script>");
                }


                conn.Close();
                
            }
           
        }

        // Perform stock out operation
        protected void btnStockOut_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Visible = false;

            // Execute only when user input is valid
            if (checkValidity())
            {

                int updatedStockQty = currentQty - Int32.Parse(txtQty.Text);

                if(updatedStockQty >= 0)
                {
                    conn = new SqlConnection(strCon);
                    conn.Open();

                    String addStockQty = "UPDATE ArtWork SET stockQty = @qty WHERE awID = @awID";

                    SqlCommand updateStock = new SqlCommand(addStockQty, conn);
                    updateStock.Parameters.AddWithValue("@awID", getAWID());
                    updateStock.Parameters.AddWithValue("@qty", updatedStockQty);

                    int i = updateStock.ExecuteNonQuery();

                    // Check if stockQty have updated successfully
                    if (i > 0)
                    {
                       lblSucessMsg.Visible = true;
                       Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                    else
                    {
                        Response.Write("<script>alert('Fail to update stock quantity!')</script>");
                    }


                    conn.Close();

                }
                else
                {
                    lblErrorMsg.Visible = true;
                    lblErrorMsg.Text = "Insufficient stock quantity!";
                }
                

            }
        }
    }
}