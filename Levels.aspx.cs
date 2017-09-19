using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Levels : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int domainId = 0;
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT "))
            {

            }
        }
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}