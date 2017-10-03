using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if(!IsPostBack)
        {
            lblWarning.Visible = false;
        }
        if(Session["LoggedIn"] != null)
        {
            Response.Redirect("Home.aspx");
        }
    }
    protected void ValidateUser(object sender, EventArgs e)
    {
        int userId = 0;
        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
        Byte[] hashedBytes;
        UTF8Encoding encoder = new UTF8Encoding();
        hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(tbxPassword.Text.Trim()));
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Validate_User"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmailId", tbxEmailId.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", hashedBytes);
                cmd.Connection = con;
                con.Open();
                userId = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
            }
            switch (userId)
            {
                case -1:
                    lblWarning.Visible = true;
                    lblWarning.Text = "Email Id and/or password is incorrect.";
                    lblWarning.ForeColor = System.Drawing.Color.Red;
                    break;
                case -2:
                    lblWarning.Visible = true;
                    lblWarning.Text = "Account has not been activated.";
                    lblWarning.ForeColor = System.Drawing.Color.Red;
                    break;
                case -3:
                    Session["LoggedIn"] = userId;
                    Response.Redirect("~/ADMIN_PANEL/ManageDomain.aspx");
                    break;
                default:
                    Session["LoggedIn"] = userId;
                    Response.Redirect("Home.aspx");
                    break;
            }
        }
    }
}