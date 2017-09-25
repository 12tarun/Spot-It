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
        string solutionDataString = "";
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
                            Session["IMGDATAQUES"] = imagedata;
                            questionDataString = Convert.ToBase64String(imagedata);
                        }
                    }
                }
            }
            imgQuestion.ImageUrl = "data:Image/png;base64," + questionDataString;

            if (IsPostBack)
            {
                if (Session["IMGDATAQUES"] == Session["IMGDATASOL"])
                {
                    int ID = Convert.ToInt32(Session["SOLUTION"]);
                    string constr2 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr2))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT ImageData FROM TblSolution WHERE SolutionId = '" + ID + "'"))
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
                                    solutionDataString = Convert.ToBase64String(imagedata);
                                }
                            }
                        }
                    }
                    imgSolution.ImageUrl = "data:Image/png;base64," + solutionDataString;
                }
                else
                {
                    lblWarning.Visible = true;
                    lblWarning.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }


    /*  private DataSet GetData()
      {
          int solId = Convert.ToInt32(Session["SOLUTION"]);
          string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
          using (SqlConnection con = new SqlConnection(constr))
          {
              SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM TblSolution WHERE SolutionId ='" + solId + "'", con);
              DataSet ds = new DataSet();
              sda.Fill(ds);
              return (ds);
          }
      }  */

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Levels.aspx");
    }

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void btnSolutionUpload_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["SOLUTION"]);
        HttpPostedFile postedFile = fupdSolution.PostedFile;
        string fileName = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(fileName);
        int fileSize = postedFile.ContentLength;
        if (fupdSolution.HasFile)
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
            Session["IMGDATASOL"] = bytes; 
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE TblSolution SET ImageData = @ImageData WHERE SolutionId='" + id + "'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@ImageData", bytes);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }
    }
}