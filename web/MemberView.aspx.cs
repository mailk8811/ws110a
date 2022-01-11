using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            if (Session["role"] != null)
            {
                int role = int.Parse(Session["role"].ToString());

                if (role == 0) DetailsView1.Rows[8].Visible = false;
            }

            string mode = Request.QueryString["mode"].ToString();
            if (mode == "1") DetailsView1.DefaultMode = DetailsViewMode.Insert;
            else if (mode == "2") DetailsView1.DefaultMode = DetailsViewMode.Edit;
        }
    }
}