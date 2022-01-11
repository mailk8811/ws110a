<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberEdit.aspx.cs" Inherits="MemberEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>id</td>
                    <td><asp:TextBox ID="TextBox0" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>password</td>
                    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>personal_id</td>
                    <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>name</td>
                    <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>sex</td>
                    <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>birthday</td>
                    <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>phone</td>
                    <td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>address</td>
                    <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>role</td>
                    <td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                </tr>
            </table>
            <asp:Button ID="Button1" runat="server" Text="Send" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
