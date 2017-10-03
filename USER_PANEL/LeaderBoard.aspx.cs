using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class USER_PANEL_LeaderBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["LoggedIn"] != null)
        {
            
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM TblScore WHERE Rank <='" + 5 + "'",con))
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("Rank");
                    dt.Columns.Add("Username");
                    dt.Columns.Add("Score");

                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while(rdr.Read())
                    {
                        DataRow dr = dt.NewRow();
                        dr["Rank"] = rdr["Rank"];
                        dr["Username"] = rdr["Username"];
                        dr["Score"] = rdr["Score"];

                        dt.Rows.Add(dr);
                    }

                    grid1.DataSource = dt;
                    grid1.DataBind();
                }
            }
       
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}