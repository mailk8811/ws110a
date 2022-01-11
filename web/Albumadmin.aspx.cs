using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Albumadmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {

        }
    }

    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        FileUpload fileUpload = e.Item.FindControl("FileUpload1") as FileUpload;
        byte[] imageBytes = new byte[fileUpload.PostedFile.InputStream.Length];
        fileUpload.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length);

        e.Values["image_data"] = Convert.ToBase64String(imageBytes);
        e.Values["image_mine"] = fileUpload.PostedFile.ContentType;
        e.Values["file_name"] = fileUpload.FileName;
    }
}