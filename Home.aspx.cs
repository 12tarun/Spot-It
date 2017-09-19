using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Text;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["LoggedIn"]);
        string username = "";
        string imageDataString = "";
        if (Session["LoggedIn"] != null)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ImageData , Username FROM Users WHERE UserId = '"+id+"'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        while(reader.Read())
                        {
                            username = reader["Username"].ToString();
                            byte[] imagedata = (byte[])reader["ImageData"];
                            imageDataString = Convert.ToBase64String(imagedata);
                        }
                    }
                }
            }
            Label_username.Text += username;
            Profile_Pic.ImageUrl = "data:Image/png;base64," + imageDataString;
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session["LoggedIn"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void Domain1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Levels.aspx");
    }

    protected void Domain2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Levels.aspx");
    }

    protected void Domain3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Levels.aspx");
    }

    protected void Domain4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Levels.aspx");
    }
}