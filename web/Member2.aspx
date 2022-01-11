<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Member2.aspx.cs" Inherits="Member2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        #customers {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #customers tr:hover {
                background-color: #ddd;
            }

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="customers">
                <tr>
                    <th>姓名</th>
                    <th>生日</th>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label></td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("birthday") %>'></asp:Label></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
