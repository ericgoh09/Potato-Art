using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Retrieve Gender from Cookie 
            //and display different advertisement banner based on gender
            //place your code here...
            Control ctlControl;
            if (Request.Cookies["Gender"] != null)
            {
                if (Request.Cookies["Gender"].Value == "Gender=Male")
                    ctlControl = LoadControl("male.ascx");
                else
                    ctlControl = LoadControl("female.ascx");
            }
            else
                ctlControl = LoadControl("male.ascx");
            contentAd.Controls.Add(ctlControl);
        }
    }
}