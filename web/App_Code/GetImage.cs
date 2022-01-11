using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// GetImage 的摘要描述
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
[System.Web.Script.Services.ScriptService]
public class GetImage : System.Web.Services.WebService {

    public GetImage () {

        //如果使用設計的元件，請取消註解下列一行
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod]
    public string HowAreYou(int state)
    {
        if(state == 1) return "Fine. Thanks.";
        else return "Bad Bad Bad.";
    }

    [WebMethod]
    public string ReadImage(int id)
    {
        string image_mine = "";
        string image_data = "";
        string file_name = "";
        string image_base64 = "";

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
            image_base64 = "data:" + image_mine + ";base64," + image_data;
        }
        reader.Close();
        conn.Close();

        return image_base64;
    }
}
