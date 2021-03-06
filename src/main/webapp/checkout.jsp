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
    <title>Home</title>
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
                    <h1><a class="navbar-brand" href="showgoods.html">电子商城</a></h1>
                </div>
                <div class="col-lg-5 col-md-6 search-right">
                    <form class="form-inline my-lg-0" action="showsearchgoods.html" method="post">
                        <input class="form-control mr-sm-2" type="search" placeholder="搜索" name="string">
                        <button class="btn" type="submit">搜索</button>
                    </form>
                </div>
                <div class="col-lg-4 col-md-3 right-side-cart">
                    <div class="cart-icons">
                        <ul>
                            <li>
                                <button type="button" data-toggle="modal" data-target="#exampleModal" onclick="getinfo()"> <span class="far fa-user"></span></button>
                            </li>
                            <li class="toyscart toyscart2 cart cart box_1">
                                <a href="checkout.html"><span class="fas fa-cart-arrow-down"></span></a>
                            </li>
                            <li>
                                <a href="history_orders.html"><span class="fas fa-history"></span></a>
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
            <%--<div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
               <ul class="navbar-nav ">
                  <li class="nav-item active">
                     <a class="nav-link" href="/showgoods.html">首页<span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                     <a href="about.html" class="nav-link">About</a>
                  </li>
                  <li class="nav-item">
                     <a href="service.html" class="nav-link">Service</a>
                  </li>
                  <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     Pages
                     </a>
                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="nav-link" href="icon.html">404 Page</a>
                        <a class="nav-link " href="typography.html">Typography</a>
                     </div>
                  </li>
                  <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     Product
                     </a>
                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="nav-link" href="product.html">Kids Toys</a>
                        <a class="nav-link " href="product.html">Dolls</a>
                        <a class="nav-link " href="product.html">Key Toys</a>
                        <a class="nav-link " href="product.html">Boys Toys</a>
                     </div>
                  </li>
                  <li class="nav-item">
                     <a href="contact.html" class="nav-link">Contact</a>
                  </li>
               </ul>
            </div>--%>
        </nav>
    </div>
</div>
<!--//headder-->
<!-- banner -->
<div class="inner_page-banner one-img" style="min-height: 200px;">
</div>
<!--//banner -->
<!-- top Products -->
<section class="checkout py-lg-4 py-md-3 py-sm-3 py-3" style="background: url(pictures/b7.jpg) repeat">
    <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <div class="shop_inner_inf">
            <c:if test="${empty cartVOList}">
                <h3>您的购物车里什么也没有哦~快去购物吧！</h3>
                <div width="300px"></div>
            </c:if>
            <c:if test="${not empty cartVOList}">
            <div class="privacy about">
                <h3>Chec<span>kout</span></h3>
                <div class="checkout-right">
                    <h4>Your shopping cart contains: <span>${cartVOList.size()}Products</span></h4>
                    <table class="timetable_sub">
                        <thead>
                        <tr>
                            <th>SL No.</th>
                            <th>Product</th>
                            <th>Quality</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Remove</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${cartVOList}" var="cartVO">
                        <tr class="rem1">
                            <td class="invert"><input type="checkbox" name="buy" value="${cartVO.cid}"/>${cartVO.cid}</td>
                            <td class="invert-image"><a href="single.html?gid=${cartVO.gid}"><img src="${cartVO.gpicture}" alt=" " style="width: 150px;height: 150px"></a></td>
                            <td class="invert">
                                <div class="quantity">
                                    <div class="quantity-select">
                                        <a id="minus" href="javascript:doMinus(${cartVO.cid})"><div class="entry value-minus">&nbsp;</div></a>
                                        <div class="entry value"><span>${cartVO.gcount}</span></div>
                                        <a id="plus" href="javascript:doPlus(${cartVO.cid})"><div class="entry value-plus active">&nbsp;</div></a>
                                    </div>
                                </div>
                            </td>
                            <td class="invert">${cartVO.gname}</td>
                            <td class="invert">${cartVO.gprice}</td>
                            <td class="invert">
                                    <a id="removeA" href="javascript:doRemove(${cartVO.cid})" style="color: black">
                                        x
                                    </a>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="checkout-left">
                    <div class="col-md-4 checkout-left-basket">
                        <h4>Continue to basket</h4>
                        <ul>
                            <c:set var="sum" value="0"></c:set>
                            <c:forEach items="${cartVOList}" var="cartVO">
                            <li>${cartVO.gname}<i>-</i> <span>${cartVO.gprice*cartVO.gcount}</span></li>
                                <c:set var="sum" value="${sum+cartVO.gprice*cartVO.gcount}"></c:set>
                            </c:forEach>
                            <li>Total <i>-</i> <span>${sum}</span></li>
                        </ul>
                    </div>
                    <div class="col-md-8 address_form">
                        <div class="checkout-right-basket">
                            <a id="payForThings" href="javascript:doPay()">Make a Payment </a>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                    <div class="clearfix"></div>
                </div>
                </c:if>
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
<script>
    $('.value-plus').on('click', function () {
        var divUpd = $(this).parent().find('.value'),
            newVal = parseInt(divUpd.text(), 10) + 1;
        divUpd.text(newVal);
    });
    function doPlus(cid){
        location.href = "pluscart.html?cid="+cid;
    }

    $('.value-minus').on('click', function () {
        var divUpd = $(this).parent().find('.value'),
            newVal = parseInt(divUpd.text(), 10) - 1;
        if (newVal >= 1) divUpd.text(newVal);
    });
    function doMinus(cid){
        location.href = "minuscart.html?cid=" + cid;
    }
</script>
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
<script type="text/javascript">
    function doRemove(cid){
        if(confirm("您是否确定删除编号为："+cid+" 的商品吗？")){
            location.href = "removecart.html?cid="+cid;
        }
    }
</script>
<script type="text/javascript">
    function doPay(){
        var arr=new Array();//定义一个数组
        $('input[name="buy"]:checked').each(function(){
            arr.push($(this).val());
        });
        if( $('input[name="buy"]:checked').length==0){
            //如果当前什么也没选
            alert("您什么也没选！请重新选择");
        }else if(confirm("您是否确定购买这些商品？")){
            $.ajax({
                type: "POST",
                url: "paythings.html",
                dataType: 'json',
                data: {"list":arr},
                success: function(data){
                    location.href = "payment.html";
                },
                error: function(res){
                }
            });
        }
    }
</script>
<!-- //here ends scrolling icon -->
<!--bootstrap working-->
<script src="js/bootstrap.min.js"></script>
<!-- //bootstrap working-->
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