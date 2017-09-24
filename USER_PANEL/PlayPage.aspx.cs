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

        if (!IsPostBack)
        {
            string[] filePaths = Directory.GetFiles(Server.MapPath("~/Images/"));
            List<ListItem> files = new List<ListItem>();
            foreach (string filePath in filePaths)
            {
                string fileName = Path.GetFileName(filePath);
                files.Add(new ListItem(fileName, "~/Images/" + fileName));
            }
            GridViewSolution.DataSource = files;
            GridViewSolution.DataBind();
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

    protected void btnSolutionUpload_Click(object sender, EventArgs e)
    {
        if (fupdSolution.HasFile)
        {
            string fileName = Path.GetFileName(fupdSolution.PostedFile.FileName);
            fupdSolution.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}