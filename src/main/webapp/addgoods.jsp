<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>新增商品</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="" />
    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!--//meta tags ends here-->
    <!--booststrap-->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <!--//booststrap end-->
    <!-- font-awesome icons -->
    <link href="css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- //font-awesome icons -->
    <!--Shoping cart-->
    <link rel="stylesheet" href="css/shop.css" type="text/css" />
    <!--//Shoping cart-->
    <!--stylesheets-->
    <link href="css/style.css" rel='stylesheet' type='text/css' media="all">
    <!--//stylesheets-->
    <link href="http://fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">

</head>

<body>
<!--headder-->
<div class="header-outs" id="home">
    <div class="header-bar">
        <div class="info-top-grid">
            <div class="info-contact-agile">
                <ul>
                    <li>
                        <span class="fas fa-phone-volume"></span>
                        <p>+(000)123 4565 32</p>
                    </li>
                    <li>
                        <span class="fas fa-envelope"></span>
                        <p>info@example1.com</p>
                    </li>
                    <li>
                    </li>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <div class="hedder-up row">
                <div class="col-lg-3 col-md-3 logo-head">
                    <h1><a class="navbar-brand" href="admin.html">电子商城</a></h1>
                </div>
                <div class="col-lg-5 col-md-6 search-right">
                    <form class="form-inline my-lg-0" action="#" method="post" hidden>
                        <input class="form-control mr-sm-2" type="search" placeholder="搜索" name="string">
                        <button class="btn" type="submit">搜索</button>
                    </form>
                </div>
                <div class="col-lg-4 col-md-3 right-side-cart">
                    <div class="cart-icons">
                        <ul>
                            <li>
                                <button type="button" data-toggle="modal" data-target="#exampleModal"> <span class="far fa-user"></span></button>
                            </li>
                            <li class="toyscart toyscart2 cart cart box_1" hidden>
                                <span class="fas fa-cart-arrow-down"></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
    </div>
</div>
<!--//headder-->
<!-- banner -->
<div class="inner_page-banner one-img" style="background: url('pictures/b7.jpg') repeat center;min-height: 200px;">
</div>
<!--//banner -->

<!--Typography-->
<section class="inner-pages py-5">
    <div class="container py-xl-5 py-sm-3">
        <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">新增商品</h3>
        <!-- forms -->
        <div class="typo-section py-4 border-top border-bottom">
            <h3 class="typo-main-heading mb-lg-4 mb-3 pr-3 pb-1">商品信息</h3>
            <h4 class="typo-sub-heading mb-3">必填</h4>
            <form action="doadd.html" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                    <label for="gname" class="col-sm-2 col-form-label">商品名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="gname" name="gname" placeholder="商品名" onblur="checkrepeat(this.value)">
                        <div id="f"></div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="gcount" class="col-sm-2 col-form-label">库存</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="gcount" name="gcount" placeholder="库存">
                    </div>
                </div>
                <fieldset class="form-group">
                    选择文件:<input type="file" name="file" onchange="showImg('gpicture',this)" /><br />
                    <div id="gpicture" name="gpicture" style="display:none"><img src="" title="图片预览" width="200" height="200"></div>
                </fieldset>
                <div class="form-group row">
                    <label for="gprice" class="col-sm-2 col-form-label">价格</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="gprice" name="gprice" placeholder="价格">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <input type="submit" class="btn btn-primary" value="提交" />
                    </div>
                </div>
            </form>
            <!--// form2 -->
        </div>
    </div>
</section>
<!--footer-->
<footer class="py-lg-4 py-md-3 py-sm-3 py-3 text-center">
    <div class="copy-agile-right">
        <p>
            Copyright &copy; 2019 sdcclub All rights reserved.
        </p>
    </div>
</footer>
<!--//footer-->
<!-- Modal 1-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">个人信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="register-form">
                    <form action="#" method="post">
                        <div class="fields-grid">
                            <div  class="styled-input" >
                                <label class="col-sm-4 col-form-label" name="username" style="display: inline-block;">用户名</label>
                                <div id="infousername"style="display: inline-block;"></div>
                            </div>
                            <div class="styled-input" >
                                <label class="col-sm-4 col-form-label" name="gender"style="display: inline-block;">性别</label>
                                <div id="infogender"style="display: inline-block;"></div>
                            </div>
                            <div class="styled-input" >
                                <label class="col-sm-4 col-form-label" name="mobile"style="display: inline-block;">联系方式</label>
                                <div id="infomobile"style="display: inline-block;"></div>
                            </div>
                            <div class="styled-input" >
                                <label class="col-sm-4 col-form-label" name="address"style="display: inline-block;">收货地址</label>
                                <div id="infoaddress"style="display: inline-block;"style="display: inline-block;"></div>
                            </div>
                            <div class="styled-input">
                                <label class="col-sm-4 col-form-label" name="birthday"style="display: inline-block;">出生日期</label>
                                <div id="infobirthday"style="display: inline-block;"></div>
                            </div>
                            <!--                           <button type="submit" class="btn subscrib-btnn">Login</button>-->
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondarys" onclick="logout()">退出登录</button>
                <button type="button" class="btn btn-primary" onclick="modifyuserinfo()">修改</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- //Modal 1-->
        <!--js working-->
        <script src='js/jquery-2.2.3.min.js'></script>
        <!--//js working-->
        <!-- cart-js -->
        <script src="js/minicart.js"></script>
        <script>
            toys.render();

            toys.cart.on('toys_checkout', function(evt) {
                var items, len, i;

                if(this.subtotal() > 0) {
                    items = this.items();

                    for(i = 0, len = items.length; i < len; i++) {}
                }
            });
        </script>
        <!-- //cart-js -->
        <!-- start-smoth-scrolling -->
        <script src="js/move-top.js"></script>
        <script src="js/easing.js"></script>
        <script>
            jQuery(document).ready(function($) {
                $(".scroll").click(function(event) {
                    event.preventDefault();
                    $('html,body').animate({
                        scrollTop: $(this.hash).offset().top
                    }, 900);
                });
            });
        </script>
        <!-- start-smoth-scrolling -->
        <!-- here stars scrolling icon -->
        <script>
            $(document).ready(function() {

                var defaults = {
                    containerID: 'toTop', // fading element id
                    containerHoverID: 'toTopHover', // fading element hover id
                    scrollSpeed: 1200,
                    easingType: 'linear'
                };

                $().UItoTop({
                    easingType: 'easeOutQuart'
                });

            });
        </script>
        <!-- //here ends scrolling icon -->
        <!--bootstrap working-->
        <script src="js/bootstrap.min.js"></script>
        <!-- //bootstrap working-->
        <!-- //OnScroll-Number-Increase-JavaScript -->
        <!--
-->
        <script type="text/javascript">
            function checkrepeat(gname) {
                var param = {
                    "gname": gname
                }
                $.post("checkgname.html", param, function(data) {
                    $("#f").empty();
                    if(data=="true") {
                        $("#f").append("<span class='fas fa-check-square' style='color: green;'></span>");
                        $("#handin").attr("disabled",false);
                    } else {
                        $("#f").append("<span class='fas fa-remove'style='color: red;'/>商品已存在");
                        $("#handin").attr("disabled",true);
                    }
                })
            }
        </script>
<script type="text/javascript">
    function showImg(did,obj){
        var patn = /\.jpg$|\.jpeg$|\.png$|\.gif$/i;
        if(obj.value==""||!patn.test(obj.value)){
            alert("请上传jpg、jpeg、png、gif格式的图片");
            obj.value="";
            return false;
        }
        var divObj = document.getElementById(did);
        var imgObj = divObj.firstChild;   //div要和img贴在一起。即img不能换行
        imgObj.src = getObjectURL(obj.files[0]);
        divObj.style.display="block";
    }
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
</script>
<script type="text/javascript">
    function getinfo() {
        $.post("getinfo.html", null, function (d) {
            var data = JSON.parse(d);
            var username=data.username;
            var gender=data.ugender;
            var mobile=data.umobile;
            var address=data.uaddress;
            var birthday=data.ubirthday;
            var date=new Date(birthday).toLocaleString();
            /*var year=date.getFullYear();
            var month=date.getMonth()+1;
            var day=date.getData();*/

            $("#infousername").empty();
            $("#infogender").empty();
            $("#infoaddress").empty();
            $("#infomobile").empty();
            $("#infobirthday").empty();

            $("#infousername").append("<label>" + username + "</label>");
            $("#infogender").append("<label>" + gender + "</label>");
            $("#infomobile").append("<label>" + mobile + "</label>");
            $("#infoaddress").append("<label>" + address + "</label>");
            //$("#infobirthday").append("<label>" + year+"-"+month+"-"+day+"</label>");
            $("#infobirthday").append("<label>" +date+"</label>");
        })

        Date.prototype.toLocaleString = function() {
            return this.getFullYear() + "/" + (this.getMonth() + 1) + "/" + this.getDate() ;
        };
    }

    function modifyuserinfo(){
        window.location.href="modifyuserinfo.html";
    }

    function logout(){
        window.location.href="logout.html";
    }
</script>
</body>

</html>