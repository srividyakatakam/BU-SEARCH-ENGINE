using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == "Admin")
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            Panel3.Visible = false;

        }

        else if (Session["type"] == "student")
        {
            Label1.Text = Session["name"].ToString();
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = true;
        }
        else
        {
            Panel1.Visible = true;
            Panel2.Visible = false;

        }
    }
}
