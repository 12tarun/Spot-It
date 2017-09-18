using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            Label_username.Text += Session["New"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void Domain1_Click(object sender, EventArgs e)
    {

    }

    protected void Domain2_Click(object sender, EventArgs e)
    {

    }

    protected void Domain3_Click(object sender, EventArgs e)
    {

    }

    protected void Domain4_Click(object sender, EventArgs e)
    {

    }
}