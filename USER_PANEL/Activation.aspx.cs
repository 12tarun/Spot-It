using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Activation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
        if (!this.IsPostBack)
        {
            
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string activationCode = Request["ActivationCode"];
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Users SET Verification = @Verification WHERE ActivationCode ='"+activationCode+"'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@Verification",1);
                        cmd.Connection = con;
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();
                        if (rowsAffected == 1)
                        {
                            ltMessage.Text = "Activation successful.";
                        }
                        else
                        {
                            ltMessage.Text = "Invalid Activation code.";
                        }
                    }
                }
            }
        }
    }
}