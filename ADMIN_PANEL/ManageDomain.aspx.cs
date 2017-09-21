using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web.Security;

public partial class ManageDomain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

   /*     DataSet ds = GetData();
        rptDomain.DataSource = ds;
        rptDomain.DataBind();

    }
    
    private DataSet GetData()
    { 
        if (IsPostBack)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM TblDomain", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        return (ds);
                    }
                }
            }
        }
        return null; */
    }


    protected void InsertDomain_Click(object sender, EventArgs e)
    {
        int domainId = 0;
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_Domain"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@DomainName",TbxDomainName.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    domainId = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
        Response.Redirect("ManageDomain.aspx");
    }

    protected void rptDomain_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id = Convert.ToString(e.CommandArgument);
        int domId = Convert.ToInt32(id);
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM TblDomain WHERE DomainId = @ID"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@ID", domId);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect("ManageDomain.aspx");
        }
    }
}