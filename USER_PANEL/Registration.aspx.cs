using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Web;


public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if(!IsPostBack)
        {
            lblMessage.Visible = false;
        }
    }

    protected void RegisterUser(object sender, EventArgs e)
    {
        int userId = 0;
        
        HttpPostedFile postedFile = ProfilePicUpload.PostedFile;
        string fileName = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(fileName);
        int fileSize = postedFile.ContentLength;

        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
        Byte[] hashedBytes;
        UTF8Encoding encoder = new UTF8Encoding();
        hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(tbxPassword.Text.Trim()));
        if ((fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png") && ProfilePicUpload.HasFile == true)
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_User"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Username", tbxUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", hashedBytes);
                        cmd.Parameters.AddWithValue("@Email", tbxEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Verification", 0);
                        cmd.Parameters.AddWithValue("@ImageName", fileName);
                        cmd.Parameters.AddWithValue("ImageSize", fileSize);
                        cmd.Parameters.AddWithValue("@ImageData", bytes);
                        cmd.Connection = con;
                        con.Open();
                        userId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }

                string message = string.Empty;
                switch (userId)
                {
                    case -1:
                        message = "Supplied email address has already been used.";
                        break;
                    case -2:
                        message = "Username already exists";
                        break;
                    default:
                        message = "Registration successful. Activation email has been sent.";
                        lblMessage.Visible = true;
                        lblMessage.Text = "Image is uploaded successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        SendActivationEmail(userId);
                        insertUserInScore(userId);
                        insertUserInUnlocked(userId);
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);

            }
        }
        else if (ProfilePicUpload.HasFile == false)
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_User"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Username", tbxUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", hashedBytes);
                        cmd.Parameters.AddWithValue("@Email", tbxEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Verification", 0);
                        cmd.Parameters.AddWithValue("@ImageName", fileName);
                        cmd.Parameters.AddWithValue("ImageSize", fileSize);
                        cmd.Parameters.AddWithValue("@ImageData", bytes);
                        cmd.Connection = con;
                        con.Open();
                        userId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }

                /*        using (SqlCommand cmd3 = new SqlCommand("SELECT Username FROM Users WHERE UserId='" + userId + "'"))
                        {
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd3.CommandType = CommandType.Text;
                                cmd3.Connection = con;
                                con.Open();
                                username = (cmd3.ExecuteScalar()).ToString();
                                con.Close();
                            }
                        }

                        using (SqlCommand cmd2 = new SqlCommand("Insert_Score"))
                        {
                            using (SqlDataAdapter sda2 = new SqlDataAdapter())
                            {
                                cmd2.CommandType = CommandType.StoredProcedure;
                                cmd2.Connection = con;
                                cmd2.Parameters.AddWithValue("@UserId", userId);
                                cmd2.Parameters.AddWithValue("@Username", username);
                                con.Open();
                                cmd2.ExecuteNonQuery(); 
                            }
                        }  */


                string message = string.Empty;
                switch (userId)
                {
                    case -1:
                        message = "Supplied email address has already been used.";
                        break;
                    case -2:
                        message = "Username already exists";
                        break;
                    default:
                        message = "Registration successful. Activation email has been sent.";
                        lblMessage.Visible = true;
                        lblMessage.Text = "No profile picture will upload as you didn't select any.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        SendActivationEmail(userId);
                        insertUserInScore(userId);
                        insertUserInUnlocked(userId);
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
            }
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Choose one of the following types of file i.e. .png or .jpg .";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

    private void insertUserInScore(int userId)
    {
        string username = "";
        int uId = userId;

        string constr3 = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr3))
        {

            using (SqlCommand cmd3 = new SqlCommand("SELECT Username FROM Users WHERE UserId='" +uId + "'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd3.CommandType = CommandType.Text;
                    cmd3.Connection = con;
                    con.Open();
                    username = (cmd3.ExecuteScalar()).ToString();
                    con.Close();
                }
            }

            using (SqlCommand cmd2 = new SqlCommand("Insert_Score"))
            {
                using (SqlDataAdapter sda2 = new SqlDataAdapter())
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Connection = con;
                    cmd2.Parameters.AddWithValue("@UserId", uId);
                    cmd2.Parameters.AddWithValue("@Username", username);
                    con.Open();
                    cmd2.ExecuteNonQuery();
                }
            }
        }
    }

    private void SendActivationEmail(int userId)
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        string activationCode = Guid.NewGuid().ToString();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE Users SET ActivationCode = @ActivationCode WHERE UserId ='"+userId+"'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@ActivationCode",activationCode);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        using (MailMessage mm = new MailMessage("tarunrocks122@gmail.com", tbxEmail.Text))
        {
            mm.Subject = "Account Activation";
            string body = "Hello " + tbxUsername.Text.Trim() + ",";
            body += "<br /><br />Please click the following link to activate your account";
            body += "<br /><a href = http://localhost:63569/USER_PANEL/Activation.aspx?ActivationCode="+activationCode+">Click here to activate your account.</a>";
            body += "<br /><br />Thanks";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("tarunrocks122@gmail.com", "sunshine<3.");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }
    }

    private void insertUserInUnlocked(int userId)
    {
        int totalDomains = 0;
        Session["UNLOCKED"] = 0;
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM TblDomain"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    totalDomains = (int)cmd.ExecuteScalar();
                    con.Close();
                }
            }

            int[] arrOfDomains = new int[totalDomains];
            int i = 0;
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM TblDomain"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        arrOfDomains[i] = Convert.ToInt32(rdr["DomainId"]);
                        i++;
                    }
                    con.Close();
                }
            }

            int j = 0;
            for (j = 0; j < totalDomains; j++)
            {
                using (SqlCommand cmd = new SqlCommand("Insert_Unlocked"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@DomainId", arrOfDomains[j]);
                        cmd.Parameters.AddWithValue("@LevelUnlocked", 0);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }
    }
}
