<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@page import="java.io.PrintStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@ page isErrorPage="true"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>err</title>
<link rel="stylesheet" type="text/css" href="./css/index.css">
<script type="text/javascript" src="./js/jquery-1.8.2.js"></script>
<style type="text/css">
body{
	display: flex;
   	align-items: center;
    justify-content: center;
    flex-direction: column;
	background-image: url("./img/bg/bg5.jpg");
	background-size:100%;
	background-repeat:no-repeat; 
}
#err-panel{
	margin-top: 12rem;
	display: flex;
    flex-direction: column;
	color:white;
}
h1{
	color:gold;
}
</style>
</head>
<body>
	<div id="err-panel" >
		<h1 style="font-size:2rem;color:gold;margin-bottom:.5rem">没有检测到您的登录信息</h1>
		<a style="font-size:1.5rem;color:#95fff5"  href="./">点此登录</a>
	</div>
</body>
</html>
