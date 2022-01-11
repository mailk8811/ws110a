<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login2.aspx.cs" Inherits="Login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>
    <!-- basic -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive-->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- fevicon -->
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <!-- Tweaks for older IEs-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <!-- loader  -->
        <div class="loader_bg">
            <div class="loader">
                <img src="images/loading.gif" alt="#" /></div>
        </div>
        <!-- end loader -->
        <!-- header -->
        <header>
            <!-- header inner -->
            <div class="header">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                            <div class="full">
                                <div class="center-desk">
                                    <div class="logo">
                                        <a href="index.html">
                                            <img src="images/logo.png" alt="#" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                            <nav class="navigation navbar navbar-expand-md navbar-dark ">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarsExample04">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="About.html">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="News.aspx">News  </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Album2.aspx">Album</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#contact">Contact</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Sign In</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- end header inner -->
        <!-- end header -->
        <!-- contact -->
        <div id="contact" class="contact">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3 ">
                        <h3>Member Login</h3>
                        <div class="main_form">
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="帳號" CssClass="contactus"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="帳號不可為空白!" ControlToValidate="TextBox1" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-sm-12">
                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="密碼" CssClass="contactus" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密碼不可為空白!" ControlToValidate="TextBox2" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-sm-12">
                                  <!--  <asp:Button ID="Button1" runat="server" Text="登入1" CssClass="send" OnClick="Button1_Click" />  -->
                                    <!--   <asp:Button ID="Button2" runat="server" Text="登入2" CssClass="send" OnClick="Button2_Click" /> -->
                                    <asp:Button ID="Button3" runat="server" Text="登入" CssClass="send" OnClick="Button3_Click" />
                                     <!--  <asp:Button ID="Button4" runat="server" Text="登入4" CssClass="send" OnClick="Button4_Click" />-->
                                    <!--   <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red" Visible="false"></asp:Label>-->
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [id], [password] FROM [Member] WHERE (([id] = @id) AND ([password] = @password))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="id" Type="String"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="TextBox2" PropertyName="Text" Name="password" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                      
        <!-- end contact -->
        <!-- Javascript files-->
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
