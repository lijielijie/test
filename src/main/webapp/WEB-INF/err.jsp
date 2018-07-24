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
<link rel="stylesheet" type="text/css" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<style type="text/css">
body{
	overflow: auto;
}

</style>
</head>
<body>
	<div class="err-panel" style="padding-left: 2vmin">
		<br/>
		<h1>服务器内部错误</h1>
		<br/>
		<p style="color:red">处理请求时发生错误！请确认参数正确。</p>
		<img alt="" src="img/err.jpg"
		style="top:2%; left: 33%; width: 250px; height: 95px; position: absolute;clip:rect(0px 170px 200px 0px);" />
		<br/><hr/>
		<h2>报错信息：</h2>
		<p id="err-info">
			<%//此处输出异常信息  
			exception.printStackTrace();

			ByteArrayOutputStream ostr = new ByteArrayOutputStream();
			exception.printStackTrace(new PrintStream(ostr));
			out.print(ostr);%>
		<p>

	</div>
</body>
</html>