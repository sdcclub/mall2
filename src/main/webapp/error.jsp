<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>抱歉，系统出现特殊情况</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
	<script> window.setInterval("location='login.jsp'",3000); </script>
</head>

<body style="background:#FFFFE0">
<%--${ex.message }--%>
<div style="margin-left: 200px;margin-top: 150px;">
<h3>当前页面出了一点小问题哦~</h3>
<h3>我们将在3秒后为您跳转……</h3>
</div>
</body>
</html>