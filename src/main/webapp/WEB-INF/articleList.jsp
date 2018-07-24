<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<title>文章列表</title>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<style>
html {
	font-size: 20px;
	overflow: auto;
}

body{
	font-family: "微软雅黑";
	margin: 0;padding: 0;
	width: 100%;height: 100%;
	background-color:#607D8B
}
#centent-center{
	padding-left: 5rem;
	padding-right: 5rem;
}
pre {
	font-size: 20px;
	width:100%;height:auto;
	white-space: pre-wrap;word-wrap: break-word; 
	margin-bottom: 1rem;margin-top: 1rem;
}

.image {
	width:auto;height: auto;
	margin-bottom: 1rem;margin-top: 1rem;
	background-size: 100% auto;
	color:red;
}
#article-block-otherInfo{
	color: #aaa;
	font-size: 10px;
	height:1rem;
	text-align:right;
	margin-right:0.5rem;
}
</style>
</head>

<body>
	<input type="hidden" id="method1" value="${article.centent}"/>
	<div id="panle" style="display: flex;">
		<div id="centent-left" class="grid" style="flex: 1;height:100%"></div>
		<div id="centent-center" class="grid" style="flex: 3;display: flex;flex-direction: column;background-color:rgba(255, 255, 255, 1);">
			<div id="article-title" style="height:4rem; text-align: center;margin-top: 2rem;margin-bottom: 2rem;font-size: 2rem;font-weight: bold;">${article.title}</div>
			<div id='article-block-otherInfo'></div>
			<div id="article-centent" style="flex: 1;">
			</div>
		</div>
		<div id="centent-right" class="grid" style="flex: 1;height:100%"></div>
	</div>
	<script>
		//文章放入隐藏的input再取出，可以有效的防止各种>"换行符等造成的显示异常
		var article=$('#method1').val();
		document.title="${article.title}";
		document.getElementById("article-block-otherInfo").innerHTML+="阅读("+${article.readCount}+")";
		document.getElementById("article-centent").innerHTML+=article;	
		
		function createDate(updateTime){
			return "  "+updateTime.substring(0,4)+"年"+updateTime.substring(4,6)+"月"+updateTime.substring(6,8)+"日  ";
		}
	</script>
</body>

</html>