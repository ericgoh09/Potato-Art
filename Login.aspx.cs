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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("Gender");

            conn = new SqlConnection(strCon);
            conn.Open();

            if (txtLoginEmail.Text == null || txtLoginPassword.Text == null)
            {
                
                Response.Redirect("Login.aspx");
            }
            else
            {
                SqlCommand cmdCheckEmail = new SqlCommand("SELECT * FROM Artist WHERE artistEmail = @emailInput", conn);
                cmdCheckEmail.Parameters.AddWithValue("@emailInput", txtLoginEmail.Text);
                SqlDataReader dtr = cmdCheckEmail.ExecuteReader();

                if (dtr.Read())
                {
                    if (txtLoginPassword.Text.Equals(dtr.GetString(dtr.GetOrdinal("artistPassword"))))
                    {
                        Session["AID"] = dtr.GetString(dtr.GetOrdinal("artistID"));
                        Response.Redirect("MyGallery.aspx?ID=" + dtr.GetString(dtr.GetOrdinal("artistID")));
                        conn.Close();

                    }
                    else
                    {
                        Response.Write("<script>alert('The Email or Password you have entered is wrong or not registered. Please try again.');</script>");
                        //Response.Redirect("Login.aspx");
                    }
                }
                else
                {
                    dtr.Close();

                    SqlCommand cmdCheckEmailCust = new SqlCommand("SELECT custID, custPassword FROM Customer WHERE custEmail = @emailInput", conn);
                    cmdCheckEmailCust.Parameters.AddWithValue("@emailInput", txtLoginEmail.Text);
                    SqlDataReader dtr1 = cmdCheckEmailCust.ExecuteReader();

                    if (dtr1.Read())
                    {
                        if (txtLoginPassword.Text.Equals(dtr1.GetString(dtr1.GetOrdinal("custPassword"))))
                        {
                            Session["custID"] = dtr1.GetString(dtr1.GetOrdinal("custID"));
                            

                            string cust_id = dtr1.GetString(dtr1.GetOrdinal("custID"));
                            conn = new SqlConnection(strCon);
                            conn.Open();

                            SqlCommand cmdSelect = new SqlCommand("select custGender FROM customer where custID = '" + cust_id + "'", conn);
                            
                            int result = cmdSelect.ExecuteNonQuery();
                            SqlDataReader dtr2 = cmdSelect.ExecuteReader();
                            if (dtr2.HasRows)
                            {
                                if (dtr2.Read())
                                {
                                    //This cookie will be stored in the user's PC
                                    //It is needed to display the advertisement banner based on gender
                                    string gender = dtr2["custGender"].ToString();
                                    cookie["Gender"] = gender;
                                    cookie.Expires = DateTime.Now.AddDays(30);
                                    Response.Cookies.Add(cookie);
                                }
                            }
                            Response.Redirect("homepage.aspx?ID=" + dtr1.GetString(dtr1.GetOrdinal("custID")));
                        }
                        else
                        {
                            Response.Write("<script>alert('The Email or Password you have entered is wrong or not registered. Please try again.');</script>");
                            //Response.Redirect("Login.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('The Email or Password you have entered is wrong or not registered. Please try again.');</script>");
                        //Response.Redirect("Login.aspx");
                    }

                    conn.Close();
                    dtr1.Close();
                }

                

            }

        }
    }
}