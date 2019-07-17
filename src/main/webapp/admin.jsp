<%@ page language="java" import="java.util.*" import="com.etc.model.vo.CartVO"  pageEncoding="UTF-8"%>
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
    <title>Admin</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="" />
    <script>
        addEventListener("load", function () {
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
    <!--checkout-->
    <link rel="stylesheet" type="text/css" href="css/checkout.css">
    <!--//checkout-->
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
                    <h1><a class="navbar-brand" href="#">电子商城</a></h1>
                </div>
                <div class="col-lg-5 col-md-6 search-right">
                    <form class="form-inline my-lg-0" action="#" method="post">
                        <input class="form-control mr-sm-2" type="search" placeholder="搜索" name="string" hidden>
                        <button class="btn" type="submit" hidden="hidden">搜索</button>
                    </form>
                </div>
                <div class="col-lg-4 col-md-3 right-side-cart">
                    <div class="cart-icons">
                        <ul>
                            <li>
                                <button type="button" data-toggle="modal" data-target="#exampleModal"> <span class="far fa-user"></span></button>
                            </li>
                            <li class="toyscart toyscart2 cart cart box_1" hidden>
                                <a href="#"><span class="fas fa-cart-arrow-down"></span></a>
                            </li>
                            <li hidden>
                                <a href="#"><span class="fas fa-history"></span></a>
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
<!--Checkout-->
<!-- //banner -->
<!-- top Products -->
<section class="checkout py-lg-4 py-md-3 py-sm-3 py-3">
    <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <div class="shop_inner_inf">
            <div class="privacy about">
                <h3><span>商品列表</span></h3>
                <div class="checkout-right">
                    <table class="timetable_sub">
                        <thead>
                        <tr>
                            <th>SL No.</th>
                            <th>Product</th>
                            <th>Quality</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Edit</th>
                            <th>Remove</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="good">
                            <tr class="rem1">
                                <td class="invert">${good.gid}</td>
                                <td class="invert-image"><a href="single.html?gid=${good.gid}"><img src="${good.gpicture}" alt=" " class="img-responsive"></a></td>
                                <td class="invert">${good.gcount}</td>
                                <td class="invert">${good.gname}</td>
                                <td class="invert">${good.gprice}</td>
                                <td class="invert">
                                    <a href="editgoods.html?gid=${good.gid}" style="color:#868282">edit</a>
                                </td>
                                <td class="invert">
                                    <a id="removeA" href="javascript:doRemove(${good.gid})" style="color: black">
                                        x
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="checkout-left">
                    <div class="col-md-8 address_form">
                        <div class="checkout-right-basket">
                            <a href="addgoods.html">新增商品</a>
                            <a href="echart.jsp">查看报表</a>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- //top products -->
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
                                <label class="col-sm-4 col-form-label" name="adminname" style="display: inline-block;">帐户名</label>
                                <div id="infoadminname"style="display: inline-block;"></div>
                            </div>
                            <div class="styled-input" >
                                <label class="col-sm-4 col-form-label" name="password"style="display: inline-block;">密码</label>
                                <div id="infopassword"style="display: inline-block;"></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondarys" onclick="logout()">退出登录</button>
                <button type="button" class="btn btn-primary" hidden>修改</button>
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

    toys.cart.on('toys_checkout', function (evt) {
        var items, len, i;

        if (this.subtotal() > 0) {
            items = this.items();

            for (i = 0, len = items.length; i < len; i++) {}
        }
    });
</script>
<!--// cart-js -->
<!--quantity-->
<!--closed-->
<script>
    $(document).ready(function (c) {
        $('.close2').on('click', function (c) {
            $('.rem2').fadeOut('slow', function (c) {
                $('.rem2').remove();
            });
        });
    });
</script>
<script>
    $(document).ready(function (c) {
        $('.close3').on('click', function (c) {
            $('.rem3').fadeOut('slow', function (c) {
                $('.rem3').remove();
            });
        });
    });
</script>
<!--//closed-->
<!-- start-smoth-scrolling -->
<script src="js/move-top.js"></script>
<script src="js/easing.js"></script>
<script>
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
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
    $(document).ready(function () {

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
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $.post("getadmininfo.html", null, function (d) {
            var data = JSON.parse(d);
            var adminname=data.aname;
            var password=data.apassword;

            $("#infoadminname").empty();
            $("#infopassword").empty();

            $("#infoadminname").append("<label>" + adminname + "</label>");
            $("#infopassword").append("<label>" + password + "</label>");
        });
    });

    function modifyuserinfo(){
        window.location.href="modifyuserinfo.html";
    }

    function logout(){
        window.location.href="logout.html";
    }
</script>
</body>
</html>