using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editinfo : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Student_Search"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"].ToString();
            string selectcmd = "SELECT * FROM student where Sid ='"+id+"'";
            SqlCommand cmd = new SqlCommand(selectcmd, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                txtid.Text = dr[0].ToString();
                txtname.Text = dr[1].ToString();
                txtemail.Text = dr[3].ToString();
                txtcontact.Text = dr[2].ToString();
                txtssc.Text = dr[4].ToString();
                txthsc.Text = dr[5].ToString();
                txtgrad.Text = dr[6].ToString();
                txtpgrad.Text = dr[7].ToString();
                txttech.Text = dr[8].ToString();
                txtextra.Text = dr[9].ToString();
                txtlang.Text = dr[12].ToString();
                txthobbies.Text = dr[13].ToString();
                txtaddress.Text = dr[15].ToString();
            }
            conn.Close();

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string ins = "update student set email='" + txtemail.Text + "', contact='" + txtcontact.Text + "',ssc_percentage='" + txtssc.Text + "',hsc_percentage='" + txthsc.Text + "',graduation='" + txtgrad.Text + "',post_graduation='" + txtpgrad.Text + "',technical_skills='" + txttech.Text + "',extracurricular='" + txtextra.Text + "',language='" + txtlang.Text + "',hobbies='" + txthobbies.Text + "',address='" + txtaddress.Text + "' where Sid='" + txtid.Text + "'";
        SqlCommand cmd = new SqlCommand(ins, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Updated Susscessfully.')", true);
        conn.Close();
        Session["edit"] = "yes";
        Response.Redirect("SearchStudents.aspx");
    }
}