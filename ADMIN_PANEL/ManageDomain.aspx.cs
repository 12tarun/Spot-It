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
        if (!IsPostBack)
        {
            DataSet ds = GetData();
            rptDomainDelete.DataSource = ds;
            rptDomainDelete.DataBind();

            rptDomainUpdate.DataSource = ds;
            rptDomainUpdate.DataBind();
        }
    }
    

    private DataSet GetData()
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM TblDomain", con);                
            DataSet ds = new DataSet();
            sda.Fill(ds);
            return (ds);
        }
    }
                 
               


    protected void InsertDomain_Click(object sender, EventArgs e)
    {
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
                    cmd.ExecuteNonQuery();
                }
            }
        }
        Response.Redirect("ManageDomain.aspx");
    }

    protected void rptDomain_ItemDelete(object source, RepeaterCommandEventArgs e)
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

    protected void rptDomain_ItemUpdate(object source, RepeaterCommandEventArgs e)
    {
        string id = Convert.ToString(e.CommandArgument);
        int domId = Convert.ToInt32(id);
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE TblDomain SET DomainName = @DomainName WHERE DomainId = @ID"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@ID", domId);
                    cmd.Parameters.AddWithValue("@DomainName",TbxUpdateDomain.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect("ManageDomain.aspx");
        }
    }
}