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
            rptDomainSelect.DataSource = ds;
            rptDomainSelect.DataBind();
        }
        Session["DOMAIN_ID"] = null;
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

    protected void rptDomain_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string task = Convert.ToString(e.CommandName);
        if (task == "Delete")
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
        if (task == "Update")
        {
                int rowId = (e.Item.ItemIndex);
                TextBox TbxUpdateDomain = (TextBox)rptDomainSelect.Items[rowId].FindControl("TbxUpdateDomain");
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
                            cmd.Parameters.AddWithValue("@DomainName", TbxUpdateDomain.Text.Trim());
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    Response.Redirect("ManageDomain.aspx");
                }
            
        }
        int domainId = 0;
        if(task == "Select")
        {
            string dn = Convert.ToString(e.CommandArgument);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT DomainId FROM TblDomain WHERE DomainName='"+dn+"'"))
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
            Session["DOMAIN_ID"] = domainId;
            Response.Redirect("ManageLevel.aspx");
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["LoggedIn"] = null;
        Response.Redirect("~/USER_PANEL/Login.aspx");
    }
}