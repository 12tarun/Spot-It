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

        if (Session["LoggedIn"] != null)
        {
            if (!IsPostBack)
            {
                DataSet ds = GetData();
                rptLevelSelect.DataSource = ds;
                rptLevelSelect.DataBind();

                domainId = Convert.ToInt32(Session["DOMAIN_ID"]);
            
                lblWarning.Visible = false;
 
                string dom_name = "";
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT DomainName FROM TblDomain WHERE DomainId='" + domainId + "'"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            dom_name = Convert.ToString(cmd.ExecuteScalar());
                        }
                    }
                    lblDisplayDomain.Text += dom_name;
                }
            }
            
        }
        else
        {
            Response.Redirect("/USER_PANEL/Login.aspx");
        }
    }

    private DataSet GetData()
    {
        domainId = Convert.ToInt32(Session["DOMAIN_ID"]);
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM TblLevel WHERE DomainId ='"+domainId+"'", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            return (ds);
        }
    }

    protected void InsertLevel_Click(object sender, EventArgs e)
    {
        Page.Validate("insert");
        if (!Page.IsValid)
        {
            return;
        }
        int levelId = 0;
        domainId = Convert.ToInt32(Session["DOMAIN_ID"]);
        HttpPostedFile postedFile = flupQuestionUpload.PostedFile;
        string fileName = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(fileName);
        int fileSize = postedFile.ContentLength;
        if ((fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png") && flupQuestionUpload.HasFile == true)
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
                        cmd.Parameters.AddWithValue("@LevelNumber",TbxLevelNumber.Text.Trim());
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

    protected void rptLevel_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string task = Convert.ToString(e.CommandName);
        if(task == "Select")
        {
            Session["LEVID"] = e.CommandArgument;
            Response.Redirect("ManageCoordinates.aspx");
        }
        if(task =="Delete")
        {
            string id = Convert.ToString(e.CommandArgument);
            int levId = Convert.ToInt32(id);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM TblLevel WHERE LevelId = @ID"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@ID", levId);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Redirect("ManageLevel.aspx");
            }
        }

        if (task == "UpdateLevelNum")
        {
            int rowId = (e.Item.ItemIndex);
            TextBox TbxUpdateLevelNum = (TextBox)rptLevelSelect.Items[rowId].FindControl("TbxUpdateLevelNum");
            string id = Convert.ToString(e.CommandArgument);
            int levId = Convert.ToInt32(id);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE TblLevel SET LevelNumber = @LevelNumber WHERE LevelId = @ID"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@ID", levId);
                        cmd.Parameters.AddWithValue("@LevelNumber", TbxUpdateLevelNum.Text.Trim());
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Redirect("ManageLevel.aspx");
            }
        }

        if (task == "UpdateLevelName" )
        {
            int rowId = (e.Item.ItemIndex);
            TextBox TbxUpdateLevel = (TextBox)rptLevelSelect.Items[rowId].FindControl("TbxUpdateLevel");
            string id = Convert.ToString(e.CommandArgument);
            int levId = Convert.ToInt32(id);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE TblLevel SET LevelName = @LevelName WHERE LevelId = @ID"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@ID", levId);
                        cmd.Parameters.AddWithValue("@LevelName", TbxUpdateLevel.Text.Trim());
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Redirect("ManageLevel.aspx");
            }
        }

        if (task == "UpdateQuestion")
        {
            string id = Convert.ToString(e.CommandArgument);
            int levId = Convert.ToInt32(id);
            int rowId = (e.Item.ItemIndex);
            FileUpload flupQuestionUpdate = (FileUpload)rptLevelSelect.Items[rowId].FindControl("flupQuestionUpdate");

            HttpPostedFile postedFile = flupQuestionUpdate.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = postedFile.ContentLength;
            if ((fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png") && flupQuestionUpdate.HasFile == true)
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE TblLevel SET ImageName = @ImageName, ImageSize = @ImageSize , ImageData = @ImageData  WHERE LevelId = @ID"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("@ID", levId);
                            cmd.Parameters.AddWithValue("@ImageName", fileName);
                            cmd.Parameters.AddWithValue("@ImageSize", fileSize);
                            cmd.Parameters.AddWithValue("ImageData", bytes);
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    Response.Redirect("ManageLevel.aspx");
                }
            }
            else
            {
                Label lblUpdateWarning = (Label)rptLevelSelect.Items[rowId].FindControl("lblUpdateWarning");
                lblUpdateWarning.Visible = true;
                lblUpdateWarning.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageDomain.aspx");
    }
}