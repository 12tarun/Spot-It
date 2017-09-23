using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class ManageLevel : System.Web.UI.Page
{
    int domainId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if(!IsPostBack)
        {
            lblWarning.Visible = false;
        }
        domainId = Convert.ToInt32(Session["DOMAIN_ID"]);
        string dom_name = "";
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT DomainName FROM TblDomain WHERE DomainId='"+domainId+"'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        dom_name = reader["DomainName"].ToString();
                    }
                }
            }
        }
        lblDisplayDomain.Text += dom_name;
    }


    protected void InsertLevel_Click(object sender, EventArgs e)
    {
        int levelId = 0;
        HttpPostedFile postedFile = QuestionUpload.PostedFile;
        string fileName = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(fileName);
        int fileSize = postedFile.ContentLength;
        if ((fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png") && QuestionUpload.HasFile == true)
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

            string constr2 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr2))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_Level"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@DomainId", domainId);
                        cmd.Parameters.AddWithValue("@LevelName", TbxLevelName.Text.Trim());
                        cmd.Parameters.AddWithValue("@ImageName",fileName);
                        cmd.Parameters.AddWithValue("@ImageSize",fileSize);
                        cmd.Parameters.AddWithValue("ImageData",bytes);
                        cmd.Connection = con;
                        con.Open();
                        levelId = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                }
            }
            Response.Redirect("ManageLevel.aspx");
        }
        else
        {
            lblWarning.Visible = true;
            lblWarning.Text = "Choose either .jpg or .png file.";
            lblWarning.ForeColor = System.Drawing.Color.Red;
        }
    }
}