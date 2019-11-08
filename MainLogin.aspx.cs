using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Register"] == "reg")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Registration Done Login to Continue')", true);
            Session["Register"] = "";
        }
    }
}