<%@ Page Language="VB" AutoEventWireup="false" CodeFile="newsadmin.aspx.vb" Inherits="admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>公告編輯</title>

     <style>
        .center {
          margin: 0 auto;
             text-align: center;
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
        .bar{
            float:right;
        }
    </style>
     <script>
        function resize() {
        parent.document.getElementById("imain").height = document.body.scrollHeight; //將子頁面高度傳到父頁面框架
    }
     </script>
</head>
<body onload="resize();">
    <form id="form1" runat="server">

        <div>
            
             <h1 style="text-align:center;font-weight:bolder;font-size:42px;">公告編輯
             </h1>
         
            <table style="width:100%;" id="customers">
                <tr>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" DeleteCommand="DELETE FROM [News] WHERE [Id] = @Id" InsertCommand="INSERT INTO [News] ([title], [content], [date], [user_id], [count]) VALUES (@title, @content, @date, @user_id, @count)" SelectCommand="SELECT * FROM [News] ORDER BY [date] DESC" UpdateCommand="UPDATE [News] SET [title] = @title, [content] = @content, [date] = @date, [user_id] = @user_id, [count] = @count WHERE [Id] = @Id">
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
                        <asp:LinkButton ID="lnkInsert" runat="server" cssclass="bar">新增</asp:LinkButton>
                    </td>
                
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="center" PageSize="5">
                            <Columns>
                                <asp:BoundField DataField="title" HeaderText="標題" SortExpression="title" />
                                <asp:BoundField DataField="date" DataFormatString="{0:d}" HeaderText="日期" SortExpression="date" />
                                <asp:BoundField DataField="user_id" HeaderText="作者" SortExpression="user_id" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="選取" />
                                        <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('確定要刪除嗎?')" Text="刪除" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:newsConnectionString %>" DeleteCommand="DELETE FROM [News] WHERE [Id] = @Id" InsertCommand="INSERT INTO [News] ([title], [content], [user_id]) VALUES (@title, @content, @user_id)" SelectCommand="SELECT * FROM [News] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [News] SET [title] = @title,[date]=@date,[user_id] = @user_id, [content] = @content  WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="title" Type="String" />
                                    <asp:Parameter Name="content" Type="String" />
                                    
                                    <asp:Parameter Name="user_id" Type="String" />
                                   
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="title" Type="String" />
                                    <asp:Parameter Name="date" Type="DateTime" />
                                    <asp:Parameter Name="user_id" Type="String" />
                                    <asp:Parameter Name="content" Type="String" />
                                   
                                    
                                   
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="50px" Width="585px" CssClass="center">
                                <Fields>
                                    <asp:TemplateField HeaderText="標題" SortExpression="title">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("title") %>' Width="476px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("title") %>' Width="383px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="必須填入欄位!" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="日期">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("news_date") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="作者" SortExpression="user_id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("user_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("user_id") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="必填資料!" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="內容" SortExpression="content">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Height="314px" Text='<%# Bind("content") %>' TextMode="MultiLine" Width="512px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Height="323px" Text='<%# Bind("content") %>' TextMode="MultiLine" Width="506px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="必須填入欄位!" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("content") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="LinkButton2_Click" Text="取消"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New" Text="新增"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                            </asp:DetailsView>
                        </asp:Panel>
                    </td>
                
                </tr>
               
            </table>
            <br />
            <br />
        </div>
         
    </form>
</body>
</html>
