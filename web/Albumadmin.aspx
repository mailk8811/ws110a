<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Albumadmin.aspx.cs" Inherits="Albumadmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>    
    <script>
        function resize() {
        parent.document.getElementById("imain").height = document.body.scrollHeight; //將子頁面高度傳到父頁面框架
    }
    </script>
</head>
<body onload="resize();">
    <form id="form1" runat="server">
       
            <h1 style="text-align:center;font-size:42px;font-weight:bolder">相簿編輯</h1>
        <hr />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Id" GroupItemCount="3" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FAFAD2; color: #284775;">Id:
                    <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" /><br />
                    title:
                    <asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" /><br />
                    description:
                    <asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" /><br />
                    <%--image_data:
                    <asp:Label Text='<%# Eval("image_data") %>' runat="server" ID="image_dataLabel" /><br />
                    file_name:
                    <asp:Label Text='<%# Eval("file_name") %>' runat="server" ID="file_nameLabel" /><br />--%>
                    image:<br />
                    <asp:Image ID="Image1" runat="server" Height="240"  ImageUrl='<%# "data:image/png;base64," + Eval("image_data").ToString() %>' />
                    <asp:Button runat="server" CommandName="Delete" Text="刪除" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="編輯" ID="EditButton" /><br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #FFCC66; color: #000080;">Id:
                    <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel1" /><br />
                    title:
                    <asp:TextBox Text='<%# Bind("title") %>' runat="server" ID="titleTextBox" /><br />
                    description:
                    <asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" /><br />
                    image_data:
                    <asp:TextBox Text='<%# Bind("image_data") %>' runat="server" ID="image_dataTextBox" /><br />
                    file_name:
                    <asp:TextBox Text='<%# Bind("file_name") %>' runat="server" ID="file_nameTextBox" /><br />
                    <asp:Button runat="server" CommandName="Update" Text="更新" ID="UpdateButton" /><br />
                    <asp:Button runat="server" CommandName="Cancel" Text="取消" ID="CancelButton" /><br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>未傳回資料。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr runat="server" id="itemPlaceholderContainer">
                    <td runat="server" id="itemPlaceholder"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">title:<br />
                    <asp:TextBox Text='<%# Bind("title") %>' runat="server" ID="titleTextBox" /><br />
                    description:<br />
                    <asp:TextBox Text='<%# Bind("description") %>' TextMode="MultiLine" Height="200" runat="server" ID="descriptionTextBox" /><br />
                    <%--image_data:<br />
                    <asp:TextBox Text='<%# Bind("image_data") %>' runat="server" ID="image_dataTextBox" /><br />
                    file_name:<br />
                    <asp:TextBox Text='<%# Bind("file_name") %>' runat="server" ID="file_nameTextBox" /><br />--%>
                    image:<br />
                    <asp:FileUpload ID="FileUpload1" runat="server" /><br /><br />
                    <asp:Button runat="server" CommandName="Insert" Text="插入" ID="InsertButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="清除" ID="CancelButton" /><br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #FFFBD6; color: #333333;">Id:
                    <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" /><br />
                    title:
                    <asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" />
                    <a href='<%# "data:" + Eval("image_mine").ToString() + ";base64," + Eval("image_data").ToString() %>' download='<%# Eval("file_name") %>'>下載</a><br />
                    description:
                    <asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" /><br />
                    <%--image_data:
                    <asp:Label Text='<%# Eval("image_data") %>' runat="server" ID="image_dataLabel" /><br />
                    file_name:
                    <asp:Label Text='<%# Eval("file_name") %>' runat="server" ID="file_nameLabel" /><br />--%>
                    image:<br />
                    <asp:Image ID="Image1" runat="server" Height="240"  ImageUrl='<%# "data:" + Eval("image_mine").ToString() + ";base64," + Eval("image_data").ToString() %>' />
                    <asp:Button runat="server" CommandName="Delete" Text="刪除" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="編輯" ID="EditButton" /><br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table runat="server" id="groupPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                <tr runat="server" id="groupPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #FFCC66; font-weight: bold; color: #000080;">Id:
                    <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" /><br />
                    title:
                    <asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" /><br />
                    description:
                    <asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" /><br />
                    image_data:
                    <asp:Label Text='<%# Eval("image_data") %>' runat="server" ID="image_dataLabel" /><br />
                    file_name:
                    <asp:Label Text='<%# Eval("file_name") %>' runat="server" ID="file_nameLabel" /><br />
                    <asp:Button runat="server" CommandName="Delete" Text="刪除" ID="DeleteButton" /><br />
                    <asp:Button runat="server" CommandName="Edit" Text="編輯" ID="EditButton" /><br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Album2] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Album2] ([title], [description], [image_data], [image_mine], [file_name]) VALUES (@title, @description, @image_data, @image_mine, @file_name)" SelectCommand="SELECT * FROM [Album2]" UpdateCommand="UPDATE [Album2] SET [title] = @title, [description] = @description, [image_data] = @image_data, [image_mine] = @image_mine, [file_name] = @file_name WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String"></asp:Parameter>
                <asp:Parameter Name="description" Type="String"></asp:Parameter>
                <asp:Parameter Name="image_data" Type="String"></asp:Parameter>
                <asp:Parameter Name="image_mine" Type="String"></asp:Parameter>
                <asp:Parameter Name="file_name" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String"></asp:Parameter>
                <asp:Parameter Name="description" Type="String"></asp:Parameter>
                <asp:Parameter Name="image_data" Type="String"></asp:Parameter>
                <asp:Parameter Name="image_mine" Type="String"></asp:Parameter>
                <asp:Parameter Name="file_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    </form>
</body>
</html>
