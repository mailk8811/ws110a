<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberView.aspx.cs" Inherits="MemberView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True"></CommandRowStyle>

            <EditRowStyle BackColor="#2461BF"></EditRowStyle>

            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True"></FieldHeaderStyle>
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id"></asp:BoundField>
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password"></asp:BoundField>
                <asp:BoundField DataField="personal_id" HeaderText="personal_id" SortExpression="personal_id"></asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                <asp:CheckBoxField DataField="sex" HeaderText="sex" SortExpression="sex"></asp:CheckBoxField>
                <asp:BoundField DataField="birthday" HeaderText="birthday" SortExpression="birthday"></asp:BoundField>
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone"></asp:BoundField>
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address"></asp:BoundField>
                <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

            <RowStyle BackColor="#EFF3FB"></RowStyle>
        </asp:DetailsView>
        <a href="Member.aspx">返回</a>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Member] WHERE ([id] = @id)" DeleteCommand="DELETE FROM [Member] WHERE [id] = @id" InsertCommand="INSERT INTO [Member] ([id], [password], [personal_id], [name], [sex], [birthday], [phone], [address]) VALUES (@id, @password, @personal_id, @name, @sex, @birthday, @phone, @address)" UpdateCommand="UPDATE [Member] SET [password] = @password, [personal_id] = @personal_id, [name] = @name, [sex] = @sex, [birthday] = @birthday, [phone] = @phone, [address] = @address WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="String"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="String"></asp:Parameter>
                <asp:Parameter Name="password" Type="String"></asp:Parameter>
                <asp:Parameter Name="personal_id" Type="String"></asp:Parameter>
                <asp:Parameter Name="name" Type="String"></asp:Parameter>
                <asp:Parameter Name="sex" Type="Boolean"></asp:Parameter>
                <asp:Parameter Name="birthday" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="phone" Type="String"></asp:Parameter>
                <asp:Parameter Name="address" Type="String"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="id" Name="id" Type="String"></asp:QueryStringParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String"></asp:Parameter>
                <asp:Parameter Name="personal_id" Type="String"></asp:Parameter>
                <asp:Parameter Name="name" Type="String"></asp:Parameter>
                <asp:Parameter Name="sex" Type="Boolean"></asp:Parameter>
                <asp:Parameter Name="birthday" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="phone" Type="String"></asp:Parameter>
                <asp:Parameter Name="address" Type="String"></asp:Parameter>
                <asp:Parameter Name="id" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
