<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Defaulttest.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>關於我</title>
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

     <script>
        function resize() {
        parent.document.getElementById("imain").height = document.body.scrollHeight; //將子頁面高度傳到父頁面框架
    }
     </script>
</head>
<body class="main-layout" onload="resize();">
    
    <section class="banner_main">
        <div class="container">
            <div class="row d_flex">
                <div class="col-md-5">
                    <div class="text-bg">
                        <h1>歡迎來到<br> 我的個人網站</h1>
                        <span>網站介紹</span>
                        <p>本網站設有最新公告、相簿及關於我的各個分頁可以瀏覽，登入會員後可進行各項頁面的資料管理，可新增、編輯、刪除資料 </p>
                        <a href="#">Get Started</a>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="text-img">
                        <figure><img src="images/img.png" /></figure>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end banner -->
    <!-- Hosting -->
    <div id="" class="hosting">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>What’s New In Web Hosting</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="web_hosting">
                        <figure><img src="images/web.jpg" alt="#" /></figure>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate</p>
                        <a href="#">Read more</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end Hosting -->
    <!-- Services  -->
    <div id="service" class="Services">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Best Services</h2>
                        <p>
                            Lorem ipsum dolor sittem ametamngcing elit, per sed do eiusmoad <br>
                            teimpor sittem elit inuning ut sed.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div class="Services-box">
                        <i><img src="images/service1.png" alt="#" /></i>
                        <h3> Shared Hosting</h3>
                        <p>Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci.</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div class="Services-box">
                        <i><img src="images/service2.png" alt="#" /></i>
                        <h3>Dedicated Hosting</h3>
                        <p>Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci.</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div class="Services-box">
                        <i><img src="images/service3.png" alt="#" /></i>
                        <h3>Domain Registration</h3>
                        <p>Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci.</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div class="Services-box">
                        <i><img src="images/service4.png" alt="#" /></i>
                        <h3>VPS Hosting</h3>
                        <p>Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci.</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div class="Services-box">
                        <i><img src="images/service5.png" alt="#" /></i>
                        <h3>Cloud Hosting</h3>
                        <p>Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci.</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div class="Services-box">
                        <i><img src="images/service6.png" alt="#" /></i>
                        <h3>Reseller Hosting</h3>
                        <p>Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci.</p>
                    </div>
                </div>
                <a class="read_more" href="#">Read More</a>
            </div>
        </div>
    </div>
    <!-- end Servicess -->
    <!-- why -->
    <div id="why" class="why">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Why you should choose </h2>
                        <p>making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div id="box_ho" class="why-box">
                        <i><img src="images/why1.png" alt="#" /></i>
                        <h3>Powerful Features</h3>
                        <p>making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still </p>
                    </div>
                    <a class="read_more bg" href="#">Read More</a>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div class="why-box">
                        <i><img src="images/why2.png" alt="#" /></i>
                        <h3>Totaly Optimised</h3>
                        <p>making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still </p>
                    </div>
                    <a class="read_more bg" href="#">Read More</a>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div class="why-box">
                        <i><img src="images/why3.png" alt="#" /></i>
                        <h3>Worldwide Support</h3>
                        <p>making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still </p>
                    </div>
                    <a class="read_more bg" href="#">Read More</a>
                </div>
            </div>
        </div>
    </div>
    <!-- end why -->
    
    <!--  footer -->
    <footer>
        <div class="footer">
   
            <div class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <p>© 2019 All Rights Reserved. <a href="https://html.design/">Free html Templates</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- end footer -->
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
</body>
</html>
