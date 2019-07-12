<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
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
      <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
      <!--//booststrap end-->
      <!-- font-awesome icons -->
      <link href="../css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
      <!-- //font-awesome icons -->
      <!-- For Clients slider -->
      <link rel="stylesheet" href="../css/flexslider.css" type="text/css" media="all" />
      <!--flexs slider-->
      <link href="../css/JiSlider.css" rel="stylesheet">
      <!--Shoping cart-->
      <link rel="stylesheet" href="../css/shop.css" type="text/css" />
      <!--//Shoping cart-->
      <!--stylesheets-->
      <link href="../css/style.css" rel='stylesheet' type='text/css' media="all">
      <!--//stylesheets-->
      <link href="http://fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
      <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
	</head>
    <script type="text/javascript">
        var msg = '${msg}';
        if(msg!=""&&msg!=undefined){
            alert(msg);
        }
    </script>
	<body>
        <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">登录</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="false">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <div class="register-form">
                     <form action="login.html" method="post">
                        <div class="fields-grid">
                           <div class="styled-input">
                              <input type="text" placeholder="用户名" name="username" required="">
                           </div>
                           <!--<div class="styled-input">
                              <input type="email" placeholder="Your Email" name="Your Email" required="">
                           </div>-->
                           <div class="styled-input">
                              <input type="password" placeholder="密码" name="password" required="">
                           </div>
                           <button type="submit" class="btn subscrib-btnn">登录</button>
                           <div style="float: right;margin-top: 1.5rem;"><input type="checkbox" value="0" name="identification"/><label style="font-size: 15px; color: #888888;">我是管理员</label></div>
                        </div>
                     </form>
                  </div>
               </div>
               <div class="modal-footer">
<!--                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
-->                  <button type="button" class="btn btn-secondary" >注册</button>
               </div>
            </div>
         </div>
	</body>
</html>
