﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ADMIN_PANEL_ManageCoordinatesAgain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoggedIn"] != null)
        {
            string questionDataString = "";
            int levId = Convert.ToInt32(Session["LEVID"]);
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
            imgBtnQuestion.ImageUrl = "data:Image/png;base64," + questionDataString;
        }
        else
        {
            Response.Redirect("/USER_PANEL/Login.aspx");
        }
    }

    protected void imgBtnQuestion_Click(object sender, ImageClickEventArgs e)
    {
        int x2cor = Convert.ToInt32(e.X);
        int y2cor = Convert.ToInt32(e.Y);
        int levId = Convert.ToInt32(Session["LEVID"]);
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE TblLevel SET X2 = @x2 , Y2 = @y2  WHERE LevelId = '" + levId + "'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@x2", x2cor);
                    cmd.Parameters.AddWithValue("@y2", y2cor);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            lblMessage.Visible = true;
            lblMessage.ForeColor = System.Drawing.Color.Blue;
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageCoordinates.aspx");
    }

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageDomain.aspx");
    }
}