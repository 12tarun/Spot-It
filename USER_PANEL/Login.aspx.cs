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
                cmd.Parameters.AddWithValue("@Username", tbxUsername.Text.Trim());
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
                    lblWarning.Text = "Username and/or password is incorrect.";
                    lblWarning.ForeColor = System.Drawing.Color.Red;
                    break;
                case -2:
                    lblWarning.Visible = true;
                    lblWarning.Text = "Account has not been activated.";
                    lblWarning.ForeColor = System.Drawing.Color.Red;
                    break;
                default:
                    Session["LoggedIn"] = userId;
                    int SolId = 0;
                    int Uid = Convert.ToInt32(Session["LoggedIn"]);
                    {
                        using (SqlCommand cmd = new SqlCommand("Insert_Solution"))
                        {
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@UserId", Uid);
                                cmd.Connection = con;
                                con.Open();
                                SolId = Convert.ToInt32(cmd.ExecuteScalar());
                            }
                        }
                    }
                    Session["SOLUTION"] = SolId;
                    Response.Redirect("Home.aspx");
                    break;
            }
        }
    }
}