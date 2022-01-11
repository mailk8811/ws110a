using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GetImageTest2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GetImage getImage = new GetImage();
        string image_base64 = getImage.ReadImage(4);
        Image1.ImageUrl = image_base64;
    }
}