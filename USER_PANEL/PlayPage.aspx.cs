﻿using System;
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

            int uId = Convert.ToInt32(Session["LoggedIn"]);
            int score = 0;

            string constr2 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr2))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Score FROM TblScore WHERE UserId = '" + uId + "'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        score = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                }
            }
            Session["SCORE"] = score;

            string constr4 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr4))
            {
                SqlDataAdapter da = new SqlDataAdapter("select Score from TblScore", con);
                DataSet ds = new DataSet();
                da.Fill(ds, "TblScore");

                List<int> scores = new List<int>();
                foreach (DataRow row in ds.Tables["TblScore"].Rows)
                {
                    scores.Add(Convert.ToInt32(row["Score"]));
                }

                int[] listOfScores = scores.ToArray();

                int k = 0;
                int countRank = 1;
                for (k = 0; k < listOfScores.Length; k++)
                {
                    if ((Convert.ToInt32(Session["SCORE"])) < listOfScores[k])
                        countRank++;
                }
                Session["RANK"] = countRank;
            }

            lblScore.Text = score.ToString();
            lblRank.Text = Session["RANK"].ToString();
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
        int Lno = 0;
        int score = Convert.ToInt32(Session["SCORE"]);
        int rank = Convert.ToInt32(Session["RANK"]);

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

        string found = "";
        for(i=(x-20);i<=(x+20);i++)
        {
            for(j=(y-20);j<=(y+20);j++)
            {
                if ((Xcor == i) && (Ycor == j))
                {
                    int uId = Convert.ToInt32(Session["LoggedIn"]);

                    string constr7 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr7))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT Id FROM TblPlayedQuestion WHERE UserId = @UserId AND LevelId = @LevelId"))
                        {
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.Parameters.AddWithValue("@UserId", uId);
                                cmd.Parameters.AddWithValue("@LevelId", levId);
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteScalar();
                                if (cmd.ExecuteScalar() != null)
                                {
                                    found = "yes";
                                }
                                else
                                {
                                    found = "no";
                                }
                            }
                        }
                    }

                    if (found == "no")
                    {


                        string constr2 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr2))
                        {
                            using (SqlCommand cmd = new SqlCommand("SELECT LevelNumber FROM TblLevel WHERE LevelId='" + levId + "'"))
                            {
                                using (SqlDataAdapter sda = new SqlDataAdapter())
                                {
                                    cmd.CommandType = CommandType.Text;
                                    cmd.Connection = con;
                                    con.Open();
                                    Lno = Convert.ToInt32(cmd.ExecuteScalar());
                                }
                            }
                        }

                        score = score + (Lno * 10);


                        string constr3 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr3))
                        {
                            using (SqlCommand cmd = new SqlCommand("UPDATE TblScore SET Score = @Score  WHERE UserId='" + uId + "'"))
                            {
                                using (SqlDataAdapter sda = new SqlDataAdapter())
                                {
                                    cmd.CommandType = CommandType.Text;
                                    cmd.Parameters.AddWithValue("@Score", score);
                                    cmd.Connection = con;
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }

                        string constr4 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr4))
                        {
                            SqlDataAdapter da = new SqlDataAdapter("select Score from TblScore", con);
                            DataSet ds = new DataSet();
                            da.Fill(ds, "TblScore");

                            List<int> scores = new List<int>();
                            foreach (DataRow row in ds.Tables["TblScore"].Rows)
                            {
                                scores.Add(Convert.ToInt32(row["Score"]));
                            }

                            int[] listOfScores = scores.ToArray();

                            int k = 0;
                            int countRank = 1;
                            for (k = 0; k < listOfScores.Length; k++)
                            {
                                if (score < listOfScores[k])
                                    countRank++;
                            }
                            rank = countRank;
                        }

                        string constr5 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr5))
                        {
                            using (SqlCommand cmd = new SqlCommand("UPDATE TblScore SET Rank = @Rank  WHERE UserId='" + uId + "'"))
                            {
                                using (SqlDataAdapter sda = new SqlDataAdapter())
                                {
                                    cmd.CommandType = CommandType.Text;
                                    cmd.Parameters.AddWithValue("@Rank", rank);
                                    cmd.Connection = con;
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }

                        string constr6 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr6))
                        {
                            using (SqlCommand cmd = new SqlCommand("Insert_PlayedQuestion"))
                            {
                                using (SqlDataAdapter sda = new SqlDataAdapter())
                                {
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    cmd.Parameters.AddWithValue("@UserId", uId);
                                    cmd.Parameters.AddWithValue("@LevelId", levId);
                                    cmd.Connection = con;
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }

                        lblFail.Visible = false;
                        Response.Redirect("PlayPage.aspx");
                    }
                    else
                    {
                        lblPlayedMessage.Visible = true;
                        lblPlayedMessage.ForeColor = Color.Red;
                    }
                }

                else
                {
                    lblFail.Visible = true;
                    lblFail.ForeColor = Color.Red;
                }
            }
        }
    }
}