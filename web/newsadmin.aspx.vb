
Partial Class admin_Default
    Inherits System.Web.UI.Page

    Private Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Panel1.Visible = True
        DetailsView1.ChangeMode(DetailsViewMode.Edit)
    End Sub

    Private Sub DetailsView1_ItemUpdated(sender As Object, e As DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        Panel1.Visible = False
        GridView1.DataBind()
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs)
        Panel1.Visible = False
    End Sub



    Protected Sub lnkInsert_Click(sender As Object, e As EventArgs) Handles lnkInsert.Click
        Panel1.Visible = True
        DetailsView1.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Private Sub DetailsView1_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        GridView1.DataBind()
    End Sub

    Private Sub DetailsView1_ItemUpdating(sender As Object, e As DetailsViewUpdateEventArgs) Handles DetailsView1.ItemUpdating
        Dim t As String
        t = e.OldValues("date")
        e.NewValues("date") = Now
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim Null As Object = Nothing

        If Session("id") = Null Then

            Response.Redirect("Login.aspx")

        End If

    End Sub


End Class
