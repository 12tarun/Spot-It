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
using System.Drawing;

public partial class PlayPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string questionDataString = "";
        if (Session["QUESTION"] != null)
        {
            int levId = Convert.ToInt32(Session["QUESTION"]);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ImageData FROM TblLevel WHERE LevelId = '" + levId + "'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            byte[] imagedata = (byte[])reader["ImageData"];
                            questionDataString = Convert.ToBase64String(imagedata);
                        }
                    }
                }
            }
            imgQuestion.ImageUrl = "data:Image/png;base64," + questionDataString;
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Levels.aspx");
    }

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }


    protected void imgQuestion_Click(object sender, ImageClickEventArgs e)
    {
        int levId = Convert.ToInt32(Session["QUESTION"]);
        int Xcor = Convert.ToInt32(e.X);
        int Ycor = Convert.ToInt32(e.Y);
        int x = 0;
        int y = 0;
        int i = 0;
        int j = 0;

        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT X , Y FROM TblLevel WHERE LevelId='" + levId + "'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        x = Convert.ToInt32(reader["X"]);
                        y = Convert.ToInt32(reader["Y"]);
                    }
                }
            }
        }
        for(i=(x-20);i<=(x+20);i++)
        {
            for(j=(y-20);j<=(y+20);j++)
            {
                if((Xcor==i) && (Ycor==j))
                {
                    lblSuccess.Visible = true;
                    lblSuccess.ForeColor = Color.Green;
                }
            }
        }
    }
}