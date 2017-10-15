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
            int LastLevel = 0;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT LevelNumber FROM TblLevel WHERE DomainId='" +id+ "'", con))
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("LevelNumber");

                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        DataRow dr = dt.NewRow();
                        dr["LevelNumber"] = rdr["LevelNumber"];
                        dt.Rows.Add(dr);
                        LastLevel = Convert.ToInt32(rdr["LevelNumber"]);
                    }
                    
                    grid1.DataSource = dt;
                    grid1.DataBind();
                }

                int i = 0;
                Session["LASTLEVEL"] = LastLevel;
                for (i = 0; i < LastLevel; i++)
                {
                    GridViewRow gvr = grid1.Rows[i];
                    {
                        if (gvr.RowType == DataControlRowType.DataRow)
                        {

                            Label lblLock = (Label)gvr.FindControl("lblLock");
                            if (i == 0)
                            {
                                lblLock.Visible = false;
                            }

                        }
                    }
                }
            }



            string dname = "";
            string constr2 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr2))
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
        int Lno = Convert.ToInt32(e.CommandName);
        int lastLevel = Convert.ToInt32(Session["LASTLEVEL"]);

            GridViewRow gvr = grid1.Rows[Lno-1];
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {

                    Label lblLock = (Label)gvr.FindControl("lblLock");
                    if (lblLock.Visible == false)
                    {
                        Session["QUESTION"] = e.CommandArgument;
                        Response.Redirect("PlayPage.aspx");
                    }
                    else
                    {
                        Response.Redirect("Levels.aspx");
                    }

                }
            }
        
    }
}