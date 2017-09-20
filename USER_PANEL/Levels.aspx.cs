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
        int id = Convert.ToInt32(Session["DOMAIN"]);
        string dname = "";
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT DomainName FROM TblDomain WHERE DomainId='"+id+"'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    dname = cmd.ExecuteScalar().ToString();
                }
            }
            lblDomain.Text = dname;
        }
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void L1_Click(object sender, EventArgs e)
    {

    }

    protected void L2_Click(object sender, EventArgs e)
    {

    }

    protected void L3_Click(object sender, EventArgs e)
    {

    }

    protected void L4_Click(object sender, EventArgs e)
    {

    }

    protected void L5_Click(object sender, EventArgs e)
    {

    }
}