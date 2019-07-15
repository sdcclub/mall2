<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>付款</title>
</head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="com.etc.util.AlipayConfig" %>
<%@ page import="com.alipay.api.DefaultAlipayClient" %>
<%@ page import="com.alipay.api.AlipayClient" %>
<%@ page import="com.alipay.api.request.AlipayTradePagePayRequest" %>
<%@ page import="com.etc.model.entity.Order" %>
<%@ page import="java.util.Date" %>
<%
	//获得初始化的AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

	//设置请求参数
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	alipayRequest.setReturnUrl(AlipayConfig.return_url);
	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

	//商户订单号，商户网站订单系统中唯一订单号，必填
	Order order= (Order) session.getAttribute("order");
	String out_trade_no =order.getOnumber().toString();
	//付款金额，必填
	String total_amount = order.getOprice().toString();
	//订单名称，必填
	String subject =order.getOnumber().toString();

	//商品描述，可空
	String body = "这是一个测试支付";

	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
			+ "\"total_amount\":\""+ total_amount +"\","
			+ "\"subject\":\""+ subject +"\","
			+ "\"body\":\""+ body +"\","
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

	//请求
	String result = alipayClient.pageExecute(alipayRequest).getBody();

	Date date=new Date();
	session.setAttribute("date",date);

	//输出
	out.print(result);
%>
<body>
</body>
</html>