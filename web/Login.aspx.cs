using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = TextBox1.Text;
        string password = TextBox2.Text;

        if (id == "john" && password == "12345")
        {
            Session["id"] = "john";
            Response.Redirect("Member.aspx");
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "登入失敗";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string id = TextBox1.Text;
        string password = TextBox2.Text;

        //SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = "SELECT * FROM [Member] WHERE [user_id] ='" + id + "' AND [user_password] = '" + password + "'";
        cmd.CommandText = "SELECT * FROM [Member] WHERE [id] = @input1 AND [password] = @input2";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@input1", id);
        cmd.Parameters.AddWithValue("@input2", password);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Read();
            string user_id = reader["id"].ToString();
            string user_role = reader["role"].ToString();

            Session["id"] = user_id;
            Session["role"] = user_role;
        }
        reader.Close();
        conn.Close();

        if (Session["id"] != null) Response.Redirect("Member.aspx");
        else
        {
            Label1.Visible = true;
            Label1.Text = "帳號或密碼錯誤，請再輸入一次。";
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        DataView dataView = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dataView.Count >= 1)
        {
            Session["id"] = dataView[0][0].ToString();
            Response.Redirect("Default3.aspx");
        }
        else Label1.Text = "帳號或密碼錯誤，請再輸入一次。";
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        //test id: ' or 1=1;--print '
        //test password: anything

        string id = TextBox1.Text;
        string password = TextBox2.Text;

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "SELECT * FROM [Member] WHERE [id] = '" + id + "' AND '" + password + "'";
        cmd.Parameters.Clear();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Read();
            string user_id = reader["id"].ToString();
            string user_role = reader["role"].ToString();

            Session["id"] = user_id;
            Session["role"] = user_role;
        }
        reader.Close();
        conn.Close();

        if (Session["id"] != null) Response.Redirect("Member.aspx");
        else
        {
            Label1.Visible = true;
            Label1.Text = "帳號或密碼錯誤，請再輸入一次。";
        }
    }

    
}