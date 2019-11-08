using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Check;

public partial class Login : System.Web.UI.Page
{
   SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Student_Search"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if (txtusername.Text != "" && txtpass.Text != "")
        {
            string k = "SELECT * FROM admin where username='" + txtusername.Text + "' and password='" + txtpass.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(k, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int c = ds.Tables[0].Rows.Count;
            if (c > 0)
            {
                Session["type"] = "Admin";
                Response.Redirect("uploadData.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Invalid  Email or Password')", true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Enter Email and Password')", true);
        }
    }

   
}