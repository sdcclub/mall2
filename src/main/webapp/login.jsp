<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>登录</title>
		<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link href="css/login.css" rel="stylesheet">
	</head>

	<body style="background: url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562565480836&di=741d8aab2d30e98376e2e7b723cbd15c&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D1355880457%2C1520660024%26fm%3D214%26gp%3D0.jpg)no-repeat center center fixed; background-size: 100%;">
		<div class="container">
			<div class="row row-centered">
				<div class="well col-md-6 col-centered" style="font-size: 13px; color: #A4AABA;">
					<h2>欢迎登陆</h2>
					<form:form action="" method="post" role="form">
						<div class="input-group input-group-md">
							<span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
							<input type="text" class="form-control" id="userid" name="userid" placeholder="请输入用户ID" />
						</div><br>
						<div class="input-group input-group-md">
							<span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-lock"></i></span>
							<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" />
						</div><br>
						<input type="checkbox" name="adminstrator" style="font-size: 5px; vertical-align:middle;"><label style="vertical-align:middle; margin-top:auto" >我是管理员</label>
						<a style="float:right">立即注册</a>
						<br/>
						<a href="checkout.jsp"> <button type="submit" class="btn btn-primary btn-block">登录</button></a>
						</form>
				</div>
			</div>
		</div>
	</body>

</html>