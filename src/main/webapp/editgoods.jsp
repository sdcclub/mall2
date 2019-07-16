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
    <title>修改商品</title>
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
                        <p>
                            <a href="mailto:info@example.com">info@example1.com</a>
                        </p>
                    </li>
                    <li>
                    </li>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <div class="hedder-up row">
                <div class="col-lg-3 col-md-3 logo-head">
                    <h1><a class="navbar-brand" href="index.html">Toys-Shop</a></h1>
                </div>
                <div class="col-lg-5 col-md-6 search-right">
                    <form class="form-inline my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search">
                        <button class="btn" type="submit">Search</button>
                    </form>
                </div>
                <div class="col-lg-4 col-md-3 right-side-cart">
                    <div class="cart-icons">
                        <ul>
                            <li>
                                <span class="far fa-heart"></span>
                            </li>
                            <li>
                                <button type="button" data-toggle="modal" data-target="#exampleModal"> <span class="far fa-user"></span></button>
                            </li>
                            <li class="toyscart toyscart2 cart cart box_1">
                                <form action="#" method="post" class="last">
                                    <input type="hidden" name="cmd" value="_cart">
                                    <input type="hidden" name="display" value="1">
                                    <button class="top_toys_cart" type="submit" name="submit" value="">
                                        <span class="fas fa-cart-arrow-down"></span>
                                    </button>
                                </form>
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
            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                <ul class="navbar-nav ">
                    <li class="nav-item ">
                        <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a href="about.html" class="nav-link">About</a>
                    </li>
                    <li class="nav-item">
                        <a href="service.html" class="nav-link">Service</a>
                    </li>
                    <li class="nav-item">
                        <a href="shop.html" class="nav-link">Shop Now</a>
                    </li>
                    <li class="nav-item dropdown active">
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
            </div>
        </nav>
    </div>
</div>
<!--//headder-->
<!-- banner -->
<div class="inner_page-banner one-img">
</div>
<!--//banner -->
<!-- short -->
<div class="using-border py-3">
    <div class="inner_breadcrumb  ml-4">
        <ul class="short_ls">
            <li>
                <a href="index.html">Home</a>
                <span>/ /</span>
            </li>
            <li>Typography</li>
        </ul>
    </div>
</div>
<!-- //short-->
<!--//banner -->
<!--Typography-->
<section class="inner-pages py-5">
    <div class="container py-xl-5 py-sm-3">
        <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">新增商品</h3>
        <!-- forms -->
        <div class="typo-section py-4 border-top border-bottom">
            <h3 class="typo-main-heading mb-lg-4 mb-3 pr-3 pb-1">商品信息</h3>
            <h4 class="typo-sub-heading mb-3">必填</h4>
            <form action="doedit.html" method="post" enctype="multipart/form-data">
                <input type="hidden" class="form-control" id="gid" name="gid" placeholder="商品id" value="${good.gid}">
                <div class="form-group row">
                    <label for="gname" class="col-sm-2 col-form-label">商品名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="gname" name="gname" placeholder="商品名" onblur="checkrepeat(this.value)" value="${good.gname}">
                        <div id="f"></div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="gcount" class="col-sm-2 col-form-label">库存</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="gcount" name="gcount" placeholder="库存" value="${good.gcount}">
                    </div>
                </div>
                <fieldset class="form-group">
                    选择文件:<input type="file" name="file" onchange="showImg('gpicture',this)" value="${good.gpicture}"/><br />
                    <div id="gpicture" name="gpicture"><img src="${good.gpicture}" title="图片预览" width="200" height="200" ></div>
                </fieldset>
                <div class="form-group row">
                    <label for="gprice" class="col-sm-2 col-form-label">价格</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="gprice" name="gprice" placeholder="价格" value="${good.gprice}">
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
</body>

</html>