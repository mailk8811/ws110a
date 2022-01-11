using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Member : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            string id = Session["id"].ToString();
            Label1.Text = id + " 您好，歡迎光臨。";
        }
    }

    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        RadioButton radioButton = DetailsView1.FindControl("RadioButton1") as RadioButton;
        e.NewValues["sex"] = radioButton.Checked;

        HtmlInputControl input = DetailsView1.FindControl("datepicker") as HtmlInputControl;
        e.NewValues["birthday"] = DateTime.Parse(input.Value).ToString("yyyy/MM/dd HH:mm:ss");
    }
}