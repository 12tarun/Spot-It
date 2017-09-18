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
        if(Session["LoggedIn"] != null)
        {
            Response.Redirect("Home.aspx");
        }
    }

    protected void ValidateUser(object sender, AuthenticateEventArgs e)
    {
        int userId = 0;
        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
        Byte[] hashedBytes;
        UTF8Encoding encoder = new UTF8Encoding();
        hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(Login1.Password));
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Validate_User"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username", Login1.UserName);
                cmd.Parameters.AddWithValue("@Password", hashedBytes);
                cmd.Connection = con;
                con.Open();
                userId = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
            }
            switch (userId)
            {
                case -1:
                    Login1.FailureText = "Username and/or password is incorrect.";
                    break;
                case -2:
                    Login1.FailureText = "Account has not been activated.";
                    break;
                default:
                    Session["LoggedIn"] = userId;
                    Response.Redirect("Home.aspx");
                    break;
            }
        }
    }
}