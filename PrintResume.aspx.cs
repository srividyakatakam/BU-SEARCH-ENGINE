using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class PrintResume : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Student_Search"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string email = Request.QueryString["email"].ToString();
        string contact = Request.QueryString["Contact"].ToString();

        string selectcmd = "SELECT * FROM student where email='"+ email + "' and contact = '"+ contact + "'";
        SqlCommand cmd = new SqlCommand(selectcmd, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            lblname.Text = dr[1].ToString();
            lblcontact.Text = dr[2].ToString();
            lblemail.Text = dr[3].ToString();
            lblssc.Text = dr[4].ToString();
            lblhsc.Text = dr[5].ToString();
            lblgrad.Text = dr[6].ToString();
            lblpostg.Text = dr[7].ToString();
            lbltech.Text = dr[8].ToString();
            txtextra.Text = dr[9].ToString();
            lbldob.Text = dr[10].ToString();
            lblgender.Text = dr[11].ToString();
            lbllanguage.Text = dr[12].ToString();
            lblhobbies.Text = dr[13].ToString();
            lblnationality.Text = dr[14].ToString();
            lbladd.Text = dr[15].ToString();
        }
        conn.Close();
    }
}