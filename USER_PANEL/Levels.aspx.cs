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
        if (!IsPostBack)
        {
            DataSet ds = GetData();
            rptLevelSelect.DataSource = ds;
            rptLevelSelect.DataBind();
        }
        if (Session["LoggedIn"] != null)
        {
            int id = Convert.ToInt32(Session["DOMAIN"]);
            string dname = "";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT DomainName FROM TblDomain WHERE DomainId='" + id + "'"))
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
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    private DataSet GetData()
    {
        int domId = Convert.ToInt32(Session["DOMAIN"]);
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM TblLevel WHERE DomainId ='"+domId +"'", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            return (ds);
        }
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void rptLevel_ItemSelect(object source, RepeaterCommandEventArgs e)
    {
        Response.Redirect("PlayPage.aspx");
    }
}