using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;

        if (Request.QueryString["id"] == null)
        {
            //Response.Redirect("Member.aspx");

            Button1.Text = "Insert";
            TextBox0.ReadOnly = false;
        }
        else
        {
            Button1.Text = "Update";
            TextBox0.ReadOnly = true;

            string id = Request.QueryString["id"].ToString();

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT * FROM [Member] WHERE [id] = @id";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();

                TextBox0.Text = reader["id"].ToString();
                TextBox1.Text = reader["password"].ToString();
                TextBox2.Text = reader["personal_id"].ToString();
                TextBox3.Text = reader["name"].ToString();
                TextBox4.Text = reader["sex"].ToString();
                TextBox5.Text = DateTime.Parse(reader["birthday"].ToString()).ToString("yyyy/M/d");
                TextBox6.Text = reader["phone"].ToString();
                TextBox7.Text = reader["address"].ToString();
                TextBox8.Text = reader["role"].ToString();
            }
            reader.Close();
            conn.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            SqlTransaction transaction = conn.BeginTransaction();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "INSERT INTO Member (id, password, personal_id, name, sex, birthday, phone, address, role) VALUES (@id, @password, @personal_id, @name, @sex, @birthday, @phone, @address, @role)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("id", TextBox0.Text);
            cmd.Parameters.AddWithValue("password", TextBox1.Text);
            cmd.Parameters.AddWithValue("personal_id", TextBox2.Text);
            cmd.Parameters.AddWithValue("name", TextBox3.Text);
            cmd.Parameters.AddWithValue("sex", 1);
            cmd.Parameters.AddWithValue("birthday", TextBox5.Text);
            cmd.Parameters.AddWithValue("phone", TextBox6.Text);
            cmd.Parameters.AddWithValue("address", TextBox7.Text);
            cmd.Parameters.AddWithValue("role", int.Parse(TextBox8.Text));
            cmd.Transaction = transaction;
            try
            {
                cmd.ExecuteNonQuery();
                transaction.Commit();
            }
            catch
            {
                transaction.Rollback();
            }
            finally
            {
                conn.Close();
            }
        }
        else
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            SqlTransaction transaction = conn.BeginTransaction();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "UPDATE Member SET password=@password, personal_id=@personal_id, name=@name, sex=@sex, birthday=@birthday, phone=@phone, address=@address, role=@role WHERE id=@id";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("password", TextBox1.Text);
            cmd.Parameters.AddWithValue("personal_id", TextBox2.Text);
            cmd.Parameters.AddWithValue("name", TextBox3.Text);
            cmd.Parameters.AddWithValue("sex", 1);
            cmd.Parameters.AddWithValue("birthday", TextBox5.Text);
            cmd.Parameters.AddWithValue("phone", TextBox6.Text);
            cmd.Parameters.AddWithValue("address", TextBox7.Text);
            cmd.Parameters.AddWithValue("role", int.Parse(TextBox8.Text));
            cmd.Parameters.AddWithValue("id", TextBox0.Text);
            cmd.Transaction = transaction;
            try
            {
                cmd.ExecuteNonQuery();
                transaction.Commit();
            }
            catch
            {
                transaction.Rollback();
            }
            finally
            {
                conn.Close();
            }
        }
    }
}