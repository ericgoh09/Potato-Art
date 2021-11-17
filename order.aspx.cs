using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class order : System.Web.UI.Page
    {
        SqlConnection con;
        String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int countOrder;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                lblartID.Text = Session["artID"].ToString();
                UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            }
        }
        protected void btnCalculate_Click(object sender, EventArgs e)
        {

            Label textControl1 = (Label)Repeater1.Items[0].FindControl("lblMaxQty");
            int maxQty = int.Parse(textControl1.Text);
            rvclass.MaximumValue = textControl1.Text;

            Label textControl = (Label)Repeater1.Items[0].FindControl("lblUnitPrice");
            double total = 0;
            double unitPrice = double.Parse(textControl.Text);
            double qty = double.Parse(txtQty.Text);
            total = unitPrice * qty;
            lblTotal.Text = total.ToString();

        }
        protected void btnOrder_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            }
            else
            {
                con = new SqlConnection(strCon);
                con.Open();
                SqlCommand cmdCheckCount = new SqlCommand("select count(*) from orders", con);
                countOrder = (int)cmdCheckCount.ExecuteScalar();

                SqlCommand cmd = new SqlCommand("insert into orders values (@orderID, @custID, @OrderDate, @ShipPhone, @ShipEmail, @ShipAddress, @ShipState, @ShipCity, @ShipPostalCode)", con);
                string order_id = getOrderID();
                cmd.Parameters.AddWithValue("@orderID", order_id);

                String custID = Session["custID"].ToString();

                cmd.Parameters.AddWithValue("@custID", custID);
                cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@ShipPhone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@ShipEmail", txtEmail.Text);
                cmd.Parameters.AddWithValue("@ShipAddress", txtAddress.Text);
                cmd.Parameters.AddWithValue("@ShipState", ddlState.SelectedValue);
                cmd.Parameters.AddWithValue("@ShipCity", ddlCity.SelectedValue);
                cmd.Parameters.AddWithValue("@ShipPostalCode", txtPostCode.Text);
                int i = cmd.ExecuteNonQuery();

                SqlCommand cmd1 = new SqlCommand("insert into OrderDetail values (@awID, @orderID, @qty, @unitPrice)", con);

                Label textUnitPrice = (Label)Repeater1.Items[0].FindControl("lblUnitPrice");

                cmd1.Parameters.AddWithValue("@awID", lblartID.Text);
                cmd1.Parameters.AddWithValue("@orderID", order_id);
                cmd1.Parameters.AddWithValue("@qty", int.Parse(txtQty.Text));
                cmd1.Parameters.AddWithValue("@unitPrice", Convert.ToDouble(textUnitPrice.Text));
                int i1 = cmd1.ExecuteNonQuery();
                con.Close();

                string s_url;
                s_url = "payment.aspx?orderID=" + order_id + "&totalPrice=" + lblTotal.Text;
                Response.Redirect(s_url);
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
            txtPostCode.Text = "";
        }
        private string getOrderID()
        {
            countOrder += 1;
            int temp = countOrder + 1000;
            return "O" + temp.ToString();
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            string[] johor = { "Bakri", "Batu Pahat", "Buloh Kasap", "Chaah", "Johor Bahru", "Kampong Dungun", "Kelapa Sawit", "Kluang", "Kota Tinggi", "Kulai", "Labis", "Mersing", "Muar", "Parit Raja", "Pasir Gudang Baru", "Pekan Nenas", "Pontian Kechil", "Segamat", "Sekudai", "Simpang Renggam", "Taman Senai", "Tangkak", "Ulu Tiram", "Yong Peng" };
            string[] kedah = { "Alor Setar", "Bedong", "Gurun", "Jitra", "Kuah", "Kuala Kedah", "Kulim", "Pokok Sena", "Sungai Petani" };
            string[] kelantan = { "Gua Musang", "Kampong Kadok", "Kampong Pangkal Kalong", "Kampung Lemal", "Ketereh", "Kota Bharu", "Pasir Mas", "Peringat", "Pulai Chondong", "Tanah Merah", "Tumpat" };
            string[] melaka = { "Alor Gajah", "Ayer Keroh", "Ayer Molek", "Batu Berendam", "Bemban", "Bukit Baru", "Bukit Rambai", "Jasin", "Klebang Besar", "Kuala Sungai Baru", "Masjid Tanah", "Melaka", "Pulau Sebang", "Sungai Udang" };
            string[] negeriSembilan = { "Bahau", "Kuala Klawang", "Kuala Pilah", "Nilai", "Port Dickson", "Seremban", "Tampin" };
            string[] pahang = { "Bentong Town", "Bukit Tinggi", "Jerantut", "Kuala Lipis", "Kuantan", "Mentekab", "Pekan", "Raub", "Tanah Rata", "Temerluh" };
            string[] pulauPinang = { "Bayan Lepas", "Bukit Mertajam", "Butterworth", "George Town", "Juru", "Kepala Batas", "Nibong Tebal", "Perai", "Permatang Kuching", "Sungai Ara", "Tanjung Tokong", "Tasek Glugor" };
            string[] perak = { "Bagan Serai", "Batu Gajah", "Bidor", "Ipoh", "Kampar", "Kuala Kangsar", "Lumut", "Pantai Remis", "Parit Buntar", "Simpang Empat", "Sitiawan", "Taiping", "Tapah Road", "Teluk Intan" };
            string[] perlis = { "Arau", "Kangar", "Kuala Perlis" };
            string[] sabah = { "Bandar Labuan", "Beaufort", "Donggongon", "Keningau", "Kinarut", "Kota Belud", "Kota Kinabalu", "Kudat", "Lahad Datu", "Papar", "Putatan", "Ranau", "Sandakan", "Semporna", "Tawau" };
            string[] sarawak = { "Bintulu", "Kapit", "Kuching", "Limbang", "Miri", "Sarikei", "Sibu", "Simanggang", "Sri Aman" };
            string[] selangor = { "Balakong", "Bangi", "Banting", "Batang Berjuntai", "Batu Arang", "Beranang", "Cyberjaya", "Jenjarum", "Kajang", "Klang", "Kuala Selangor", "Kuang", "Kundang", "Petaling Jaya", "Puchong" };
            string[] terengganu = { "Cukai", "Jertih", "Kertih", "Kuala Dungun", "Kuala Terengganu", "Marang", "Paka" };
            switch (ddlState.SelectedValue)
            {
                case "Johor":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < johor.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(johor[i]));
                    }
                    break;
                case "Kedah":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < kedah.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(kedah[i]));
                    }
                    break;
                case "Kelantan":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < kelantan.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(kelantan[i]));
                    }
                    break;
                case "Melaka":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < melaka.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(melaka[i]));
                    }
                    break;
                case "Negeri Sembilan":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < negeriSembilan.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(negeriSembilan[i]));
                    }
                    break;
                case "Pahang":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < pahang.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(pahang[i]));
                    }
                    break;
                case "Pulau Pinang":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < pulauPinang.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(pulauPinang[i]));
                    }
                    break;
                case "Perak":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < perak.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(perak[i]));
                    }
                    break;
                case "Perlis":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < perlis.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(perlis[i]));
                    }
                    break;
                case "Sabah":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < sabah.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(sabah[i]));
                    }
                    break;
                case "Sarawak":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < sarawak.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(sarawak[i]));
                    }
                    break;
                case "Selangor":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < selangor.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(selangor[i]));
                    }
                    break;
                case "Terengganu":
                    ddlCity.Items.Clear();
                    for (int i = 0; i < terengganu.Length; i++)
                    {
                        ddlCity.Items.Add(new ListItem(terengganu[i]));
                    }
                    break;
                default:
                    break;
            }
        }
    }
}