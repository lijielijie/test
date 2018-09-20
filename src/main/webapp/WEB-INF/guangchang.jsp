<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<base href="<%=basePath%>" />
<link rel="stylesheet" type="text/css" href="./css/index.css">
<title>编辑文章</title>
<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
<style type="text/css">
html {
	font-size: 20px;
	overflow: hidden;
	background-image: url("./img/bg/bg1.jpg");background-repeat:no-repeat;
}

* {
	font-family: "微软雅黑";
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}
p {
	width: 100%;
	height: 2rem;
	line-height: 2rem;
	margin: 0.5rem;
	cursor: pointer;
}

#article-content{
	display: flex;
	flex-direction: column;
	overflow: auto;
}
.center-article-left>p:hover{
 	background-color: red;
}
#center-article-center{
	display: flex;
	flex-flow: row wrap;
    align-content: flex-start;
}

.article-block{
	display: flex;
	width:23%;height:8rem;
	margin:0.8rem;
	margin-right:0rem;
	background-color: #fff;
	cursor: pointer;
	padding: 0.1rem;
}
.article-block:hover{
	background-color: gold;
}
.article-block-image{
	margin:0.5rem;
	max-height: 7rem;
	max-width: 40%;
}
.article-block-title{
	font-weight: bold;
	font-size: 22px;
	height:6rem;max-width: 80%;
	margin:0.5rem;
	word-break:break-all; 
	text-overflow: ellipsis
}
.article-block-otherInfo{
	color: #aaa;
	font-size: 10px;
	height:1rem;
	text-align:right;
	margin-right:0.5rem;
}
</style>
</head>

<body >
<div id="article-content">
	<div id="center-article" class="article-column" style="display: flex;flex-direction: row;background-color: #fff">
		<div id="center-article-left" class="article-column" style="flex: 1;background-color: #c9513e;padding: 1rem;font-weight: bold;">
			<p id="allArticles-all" onclick="getArticleList()" style="color:white;">全部文章</p>
			<p id="allArticles-self" onclick="selfArticleList()" style="color:#ddd;">自己文章</p>
		</div>
		<div id="center-article-center" class="article-column" style="flex: 8;background-color: pink">

		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	getArticleList();
	selfArticleList();
	
	function getArticleList(){
		$.getJSON("article/getArticleList", function(result){
			articleBlock(result)
			document.getElementById("allArticles-all").innerHTML="全部文章(<b style='color:#00ffde;font-size: 18px;'>"+result.length+"</b>)";
		  });
	}
	function selfArticleList(){
		$.getJSON("article/selfArticleList", function(result){
			articleBlock(result)
			document.getElementById("allArticles-self").innerHTML="自己文章(<b style='color:#00ffde;font-size: 18px;'>"+result.length+"</b>)";
		  });
	}
	function articleBlock(result){
		document.getElementById("center-article-center").innerHTML="";
		for (var i = 0; i < result.length; i++) {
			nodeHtml="<div class='article-block' id='"+result[i]["id"]+"' onclick='openUrl(this)'>"+
					 "<img class='article-block-image' alt='暂无封面' src='img/pig.gif'></img><div>"+
					 "<div class='article-block-title'>"+result[i]["title"]+"</div>"+
					 "<div class='article-block-otherInfo'>"+result[i]["userName"]+createDate(result[i]["updateTime"])+" ("+result[i]["readCount"]+")</div></div></div>"
			document.getElementById("center-article-center").innerHTML+=nodeHtml;		 
		}
	} 
	function createDate(updateTime){
		return "  "+updateTime.substring(0,4)+"/"+updateTime.substring(4,6)+"/"+updateTime.substring(6,8)+" ";
	}
	//开新窗口展示文章
	function openUrl(e){
       window.open("article/openArticle?id="+e.id);
    }
</script>
</html>
