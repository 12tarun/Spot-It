using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ManageLevel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    protected void InsertLevel_Click(object sender, EventArgs e)
    {
        int domainId = 0;
        string dn = tbxDomainName.Text.Trim();
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT DomainId FROM TblDomain WHERE DomainName='" + dn + "'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    domainId = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        string constr2 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr2))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_Level"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@DomainId",domainId);
                    cmd.Parameters.AddWithValue("@LevelName",TbxLevelName.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    domainId = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
        Response.Redirect("ManageLevel.aspx");
    }
}