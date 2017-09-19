﻿using System;
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
            Warning.Visible = false;
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
        hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(password.Text.Trim()));
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Validate_User"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username", username.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", hashedBytes);
                cmd.Connection = con;
                con.Open();
                userId = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
            }
            switch (userId)
            {
                case -1:
                    Warning.Visible = true;
                    Warning.Text = "Username and/or password is incorrect.";
                    Warning.ForeColor = System.Drawing.Color.Red;
                    break;
                case -2:
                    Warning.Visible = true;
                    Warning.Text = "Account has not been activated.";
                    Warning.ForeColor = System.Drawing.Color.Red;
                    break;
                default:
                    Session["LoggedIn"] = userId;
                    Response.Redirect("Home.aspx");
                    break;
            }
        }
    }
}