<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/jquery-ui1.css">
      <link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
      <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
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
      <!--/shop-->
      <section class="banner-bottom py-lg-5 py-3 one-img">
         <div class="container">
            <div class="inner-sec-shop pt-lg-4 pt-3">
               <div class="row">
                  <div class="col-lg-4 single-right-left ">
                     <div class="grid images_3_of_2">
                        <div class="flexslider1">
                           <ul class="slides">
                              <li data-thumb="${good.gpicture}">
                                 <div class="thumb-image"> <img src="${good.gpicture}" data-imagezoom="true" class="img-fluid" alt=" "> </div>
                              </li>
                           </ul>
                           <div class="clearfix"></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-8 single-right-left simpleCart_shelfItem">
                     <h3>${good.gname}</h3>
                     <p><span class="item_price">${good.gprice}</span>
                     </p>
                     <div class="rating1">
                        <h5>库存${good.gcount}</h5>
                     </div>
                     <div style="height: 50px"></div>
                     <div class="color-quality">
                        <div class="color-quality-right">
                           <h5>数量 :</h5>
                           <button onclick="subnum()">-</button>
                           <input onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'') "
                                   width="100px" type="number" id="count" value="1" onblur="checkGcount(this.value)"/>
                           <button onclick="addnum()">+</button>
                        </div>
                     </div>
                     <div class="description">
                        <h5>一共支付金额（默认采用支付宝付款）</h5>
                        <input class="form-control" type="text" id="price" name="Email" placeholder="${good.gprice}" readonly="readonly" >
                     </div>
                     <div class="occasional">
                        <h5></h5>
                        <div class="colr ert">
                           <label class="radio"><i></i></label>
                        </div>
                        <div class="colr">
                           <label class="radio"><i></i></label>
                        </div>
                        <div class="colr">
                           <label class="radio"><i></i></label>
                        </div>
                        <div class="clearfix"> </div>
                     </div>
                     <div class="occasion-cart">
                        <div class="toys single-item singlepage">
                           <form action="addcart.html" method="post">
                              <input type="hidden" name="gid" value="${good.gid}">
                              <input type="hidden" id="ccount" name="ccount" value="1">
                              <button type="submit" class="toys-cart ptoys-cart add" onclick="setccount()">
                                 添加购物车
                              </button>
                           </form>
                        </div>
                     </div>
                  </div>
                  <div class="clearfix"> </div>
               </div>
            </div>
         </div>
      </section>
      <footer class="py-lg-4 py-md-3 py-sm-3 py-3 text-center">
         <div class="copy-agile-right">
            <p>
               Copyright &copy; 2019 sdcclub All rights reserved.
            </p>
         </div>
      </footer>
      <!-- //Modal 1-->
      <!--jQuery-->
      <script src="js/jquery-2.2.3.min.js"></script>
      <!-- newsletter modal -->
      <!-- cart-js -->
      <script src="js/minicart.js"></script>
      <script type="text/javascript">
         function setccount() {
            $("#ccount").val($("#count").val());
         }
         function checkGcount(ccount){
            var param={
               "num":Number($("#count").val()),
               "gid":${good.gid}
            }
            $.post("checkgcount.html", param, function (data) {
               if(data=="true"){
                  $("#price").val($("#count").val()* ${good.gprice});
               }else{
                  $("#count").val(${good.gcount});
                  $("#price").val(${good.gcount}* ${good.gprice});
               }
            });
         }
         function subnum() {
            var n=$("#count").val();
            if(n>1){
               $("#count").val(n-1);
               $("#price").val($("#count").val()* ${good.gprice});
            }
         }
         function addnum() {
            var param={
               "num":Number($("#count").val()),
               "gid":${good.gid}
            }
            $.post("checkgcount.html", param, function (data) {
               if(data=="true"){
                  $("#count").val(param.num+1);
                  $("#price").val($("#count").val()* ${good.gprice});
               }
            });
         }
      </script>
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
      <!-- //cart-js -->
      <!-- price range (top products) -->
      <script src="js/jquery-ui.js"></script>
      <script>
         //<![CDATA[ 
         $(window).load(function () {
         	$("#slider-range").slider({
         		range: true,
         		min: 0,
         		max: 9000,
         		values: [50, 6000],
         		slide: function (event, ui) {
         			$("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
         		}
         	});
         	$("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));
         
         }); //]]>
      </script>
      <!-- //price range (top products) -->
      <!-- single -->
      <script src="js/imagezoom.js"></script>
      <!-- single -->
      <!-- script for responsive tabs -->
      <script src="js/easy-responsive-tabs.js"></script>
      <script>
         $(document).ready(function () {
         	$('#horizontalTab').easyResponsiveTabs({
         		type: 'default', //Types: default, vertical, accordion           
         		width: 'auto', //auto or any width like 600px
         		fit: true, // 100% fit in a container
         		closed: 'accordion', // Start closed if in accordion view
         		activate: function (event) { // Callback function if tab is switched
         			var $tab = $(this);
         			var $info = $('#tabInfo');
         			var $name = $('span', $info);
         			$name.text($tab.text());
         			$info.show();
         		}
         	});
         	$('#verticalTab').easyResponsiveTabs({
         		type: 'vertical',
         		width: 'auto',
         		fit: true
         	});
         });
      </script>
      <!-- FlexSlider -->
      <script src="js/jquery.flexslider.js"></script>
      <script>
         // Can also be used with $(document).ready()
         $(window).load(function () {
         	$('.flexslider1').flexslider({
         		animation: "slide",
         		controlNav: "thumbnails"
         	});
         });
      </script>
      <!-- //FlexSlider-->

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
      <!-- //smooth-scrolling-of-move-up -->
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