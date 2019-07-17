<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
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
   <link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
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
                  <p><a href="mailto:info@example.com">info@example1.com</a></p>
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
                        <button type="button" data-toggle="modal" data-target="#exampleModal"> <span class="far fa-user"></span></button>
                     </li>
                     <li class="toyscart toyscart2 cart cart box_1">
                        <a href="checkout.html">
                              <span class="fas fa-cart-arrow-down"></span>
                        </a>
                     </li>
                      <li>
                          <a href="history_orders.html"><span class="fas fa-history"></span></a>
                      </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>

   </div>
</div>
<!--//headder-->
<!-- banner -->
<div class="inner_page-banner one-img">
</div>
<!-- short -->
<div class="using-border py-3">
   <div class="inner_breadcrumb  ml-4">
      <ul class="short_ls">
         <li>Payment</li>
      </ul>
   </div>
</div>
<!-- //short-->
<!-- top Products -->
<section class="checkout py-lg-4 py-md-3 py-sm-3 py-3">
   <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
      <div class="ads-grid_shop">
         <div class="shop_inner_inf">
            <div class="privacy about">
               <div style="height: 100px"></div>
               <h3>Pay<span>ment</span></h3>
               <!--/tabs-->
               <div class="responsive_tabs">
                  <!--订单详情框-->
                  <div class="resp-tabs-container">
                     <h5>订单详情</h5>
                     <table class="timetable_sub">
                        <thead>
                        <tr>
                           <th>编号</th>
                           <th>商品图片</th>
                           <th>商品名</th>
                           <th>购买个数</th>
                           <th>单个价格</th>
                           <th>总价</th>
                        </tr>
                        </thead>
                        <c:set var="count" value="1"/>
                        <tbody>
                        <c:forEach items="${ordervolist}" var="goods">
                           <tr class="rem1">
                              <td class="invert">
                                 <c:out value="${count}"/>
                                 <c:set var="count" value="${count+1}"/>
                              </td>
                              <td class="invert"><img height="150px" width="200px" src="pictures/${goods.goods.gpicture}" alt=" " class="img-responsive"></td>
                              <td class="invert-image">${goods.goods.gname}</td>
                              <td class="invert">${goods.ccount}</td>
                              <td class="invert">${goods.goods.gprice}</td>
                              <td class="invert">${goods.ccount*goods.goods.gprice}</td>
                           </tr>
                        </c:forEach>
                        </tbody>
                     </table>
                     <hr>
                      <c:set var="order" value="${ordervolist[0]}" />
                     <ul style="font-size: 20px;">
                        <li style="height: 50px;">商品总价：${order.oprice}</li>
                        <li style="height: 50px;">订单编号：${order.onumber}</li>
                        <li style="height: 50px;">创建订单时间：${order.orderdate}</li>
                     </ul>
                     <div class="checkout-right-basket">
                        <a href="alipay.html?oid=${order.oid}">立即付款</a>
                     </div>
                  </div>


               </div>
               <!--//tabs-->
            </div>
         </div>
         <!-- //payment -->
         <div class="clearfix"></div>
      </div>
   </div>
</section>

<!-- Modal 1-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Login</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <div class="register-form">
               <form action="#" method="post">
                  <div class="fields-grid">
                     <div class="styled-input">
                        <input type="text" placeholder="Your Name" name="Your Name" required="">
                     </div>
                     <div class="styled-input">
                        <input type="email" placeholder="Your Email" name="Your Email" required="">
                     </div>
                     <div class="styled-input">
                        <input type="password" placeholder="password" name="password" required="">
                     </div>
                     <button type="submit" class="btn subscrib-btnn">Login</button>
                  </div>
               </form>
            </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
<!-- easy-responsive-tabs -->
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
<!-- credit-card -->
<script src="js/creditly.js"></script>
<link rel="stylesheet" href="css/creditly.css" type="text/css" media="all" />
<script>
   $(function () {
      var creditly = Creditly.initialize(
              '.creditly-wrapper .expiration-month-and-year',
              '.creditly-wrapper .credit-card-number',
              '.creditly-wrapper .security-code',
              '.creditly-wrapper .card-type');

      $(".creditly-card-form .submit").click(function (e) {
         e.preventDefault();
         var output = creditly.validate();
         if (output) {
            // Your validated credit card output
            console.log(output);
         }
      });
   });
</script>
<!-- //credit-card -->
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
</body>
</html>