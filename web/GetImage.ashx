<%@ WebHandler Language="C#" Class="GetImage" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;

public class GetImage : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        if (context.Request.QueryString["id"] == null) return;

        string image_mine = "";
        string image_data = "";
        string file_name = "";
        string id_string = context.Request.QueryString["id"].ToString();
        int id = int.Parse(id_string);

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "SELECT * FROM [Album2] WHERE [id] = @id";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@id", id);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Read();

            image_mine = reader["image_mine"].ToString();
            image_data = reader["image_data"].ToString();
            file_name = reader["file_name"].ToString();
        }
        reader.Close();
        conn.Close();

        context.Response.ContentType = image_mine;
        //context.Response.AddHeader("content-disposition", "attachment;filename=" + HttpUtility.UrlEncode(file_name));
        context.Response.BinaryWrite(Convert.FromBase64String(image_data));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}