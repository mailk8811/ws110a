<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Member.aspx.cs" Inherits="Member" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="viewport" content="initial-scale=1, maximum-scale=1"/>
    <!-- site metas -->
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<meta name="author" content=""/>
    <title></title>
    <style>
      .center {
          margin: 0 auto;
             text-align: center;
         }
    .bar{
       
        float:right;
    }
        .active {
            width: 461px;
        }
    .bar1{
        float:right; margin-right:10px;
    }
    </style>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
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
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <script>
  $( function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( "#opener" ).on( "click", function() {
      $( "#dialog" ).dialog( "open" );
    });

    //$("#datepicker").datepicker();
    $(".datepicker").datepicker();
  } );
    </script>
         <script>
             function resize() {
                 parent.document.getElementById("imain").height = document.body.scrollHeight; //將子頁面高度傳到父頁面框架
             }
         </script>
</head>
<body onload="resize();">
    <form id="form1" runat="server">
        
        <div>
            <br />
            <h1 style="text-align:center;font-size:42px;font-weight:bolder">會員管理</h1>
            <asp:Label ID="Label1" runat="server" Text="Label" CssClass="bar1"></asp:Label>
             <br /><
            <hr />
                           
         
            <br /><br />                         
    
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="center">
                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                    <asp:HyperLinkField Text="選取" HeaderText="select" DataNavigateUrlFields="id" DataNavigateUrlFormatString="MemberView.aspx?id={0}" Visible="false"></asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="MemberView.aspx?id={0}&amp;mode=1" Text="新增" HeaderText="新增"></asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="MemberView.aspx?id={0}&amp;mode=2" Text="編輯" HeaderText="編輯"></asp:HyperLinkField>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False"></asp:BoundField>
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" Visible="False"></asp:BoundField>
                    <asp:TemplateField HeaderText="personal_id" SortExpression="personal_id">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("personal_id") %>' ID="TextBox2"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("personal_id").ToString().Substring(0,3) + "****" + Eval("personal_id").ToString().Substring(7,3)%>' ID="Label3"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                    <asp:TemplateField HeaderText="sex" SortExpression="sex">
                        <EditItemTemplate>
                            <asp:CheckBox runat="server" Checked='<%# Bind("sex") %>' ID="CheckBox1"></asp:CheckBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# bool.Parse(Eval("sex").ToString()) ? "男" : "女"  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="birthday" SortExpression="birthday">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("birthday") %>' ID="TextBox1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("birthday", "{0:yyyy年MM月dd日}") %>' ID="Label1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone"></asp:BoundField>
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" Visible="False"></asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                <FooterStyle BackColor="darkslateblue" Font-Bold="True" ForeColor="White"></FooterStyle>

                <HeaderStyle BackColor="darkslateblue" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="#EFF3FB"></RowStyle>

                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
            <br /><br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemUpdated="DetailsView1_ItemUpdated" OnItemUpdating="DetailsView1_ItemUpdating" CssClass="center">
                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True"></CommandRowStyle>

                <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True"></FieldHeaderStyle>
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id"></asp:BoundField>
                    <asp:TemplateField HeaderText="password" SortExpression="password">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("password") %>' ID="TextBox2"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("password") %>' ID="TextBox2"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text="*****" ID="Label3"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="personal_id" SortExpression="personal_id">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("personal_id") %>' ID="TextBox1"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("personal_id") %>' ID="TextBox1"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server"  Text='<%# Eval("personal_id").ToString().Substring(0,3) + "****" + Eval("personal_id").ToString().Substring(7,3)%>' ID="Label1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                    <asp:TemplateField HeaderText="sex" SortExpression="sex">
                        <EditItemTemplate>
                            <asp:RadioButton ID="RadioButton1" GroupName="sexGroup" Text="男" Checked='<%# bool.Parse(Eval("sex").ToString()) %>' runat="server" />
                            <asp:RadioButton ID="RadioButton2" GroupName="sexGroup" Text="女" Checked='<%# !bool.Parse(Eval("sex").ToString()) %>' runat="server" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:CheckBox runat="server" Checked='<%# Bind("sex") %>' ID="CheckBox1"></asp:CheckBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# bool.Parse(Eval("sex").ToString()) ? "男" : "女"  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="birthday" SortExpression="birthday">
                        <EditItemTemplate>
                            <%--<span>Date: <input runat="server" type="text" id="datepicker" class="datepicker" value='<%# Bind("birthday", "{0:MM/dd/yyyy}") %>'></span>--%>
                            <span>Date: <input runat="server" type="text" id="datepicker" class="datepicker" value='<%# DateTime.Parse(Eval("birthday").ToString()).ToString("MM/dd/yyyy") %>'/>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("birthday") %>' ID="TextBox3"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("birthday", "{0:yyyy年MM月dd日}") %>' ID="Label4"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone"></asp:BoundField>
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address"></asp:BoundField>
                    <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="#EFF3FB"></RowStyle>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Member] WHERE [id] = @id" InsertCommand="INSERT INTO [Member] ([id], [password], [personal_id], [name], [sex], [birthday], [phone], [address]) VALUES (@id, @password, @personal_id, @name, @sex, @birthday, @phone, @address)" SelectCommand="SELECT * FROM [Member] WHERE ([id] = @id)" UpdateCommand="UPDATE [Member] SET [password] = @password, [personal_id] = @personal_id, [name] = @name, [sex] = @sex, [birthday] = @birthday, [phone] = @phone, [address] = @address WHERE [id] = @id">
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
                <SelectParameters >
                    <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="id" Type="String"></asp:ControlParameter>
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
            <div>
                <br />
                <br />

            </div>
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
