<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1"/>
    <!-- site metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!-- bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <!-- style css -->
    <link rel="stylesheet" href="css/style.css"/>
    <!-- Responsive-->
    <link rel="stylesheet" href="css/responsive.css"/>
    <!-- fevicon -->
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css"/>
    <!-- Tweaks for older IEs-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen"/>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"/></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"/></script><![endif]-->
    <title></title>
    <style>
        .center {
          margin: 0 auto; 
        }
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

          

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: darkslateblue;
                color: white;
            }
    </style>
    <head>
    <script>
        function resize() {
        parent.document.getElementById("imain").height = document.body.scrollHeight; //將子頁面高度傳到父頁面框架
    }
    </script>
</head>
</head>
<body style="width:100%;" onload="resize();">
     <form id="form1" runat="server">
        
 <br />
         <h1 style="text-align:center;font-weight:bolder;font-size:42px;">最新公告</h1>
         <hr />
        <div><table style="width:100%;" id="customers">
        <tr>
            <td style="text-align: center">
          
                <asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Width="56%" CssClass="center" AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="date" HeaderText="日期" SortExpression="date" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundField>
                    <asp:BoundField DataField="title" HeaderText="標題" SortExpression="content"></asp:BoundField>
                    <asp:BoundField DataField="user_id" HeaderText="作者" SortExpression="user_id"></asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="選取" />
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:newsConnectionString %>' SelectCommand="SELECT * FROM [News] ORDER BY [date] DESC" DeleteCommand="DELETE FROM [News] WHERE [Id] = @Id" InsertCommand="INSERT INTO [News] ([title], [content], [date], [user_id], [count]) VALUES (@title, @content, @date, @user_id, @count)" UpdateCommand="UPDATE [News] SET [title] = @title, [content] = @content, [date] = @date, [user_id] = @user_id, [count] = @count WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="user_id" Type="String" />
                    <asp:Parameter Name="count" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="user_id" Type="String" />
                    <asp:Parameter Name="count" Type="Int32" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
                    </asp:SqlDataSource>
         </asp:Panel>
          
            </td>
          
        </tr>
         <tr>
             <td>
                <asp:Panel ID="Panel2" runat="server" style="text-align: center">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" SelectCommand="SELECT * FROM [News] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="50px" Width="507px" CssClass="center">
                    <Fields>
                        <asp:BoundField DataField="title" HeaderText="標題" SortExpression="title" >
                        <FooterStyle Width="60px" />
                        <HeaderStyle Width="100px" />
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="content" HeaderText="內容" SortExpression="content" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="date" HeaderText="日期" SortExpression="date" DataFormatString="{0:d}" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="user_id" HeaderText="作者" SortExpression="user_id" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                       
                    </Fields>
                </asp:DetailsView>
            </asp:Panel>
        </td>

         </tr>
    </table>
                    </div>
         <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.0.0.min.js"></script>
        <script src="js/plugin.js"></script>
        <!-- sidebar -->
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/custom.js"></script>
        <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    </form>
</body>
</html>
