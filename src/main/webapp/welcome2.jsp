<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<title>分享快乐 记录点滴</title>
	<link rel="stylesheet" type="text/css" href="css/index.css" />
	<link rel="icon" href="img/title.png" type="image/x-icon"/>
	<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
	<style type="text/css">
		body{
			background-image: url("img/welcomebg.jpg");
			display: flex;
   			align-items: center;
    		justify-content: center;
    		flex-direction: column;
		}
		#content-bg{
			margin-top: -5rem;
			display: flex;
    		flex-direction: row;
			color:white;
		}
		.lable{
			height:350px;width:200px;
    		background-color: #28a745;
    		margin:1rem;
    		text-align: center;
		}
		.lable:hover{
			cursor: pointer;
		}
		
		.lable-top-div{
			height:250px;width:200px;
		}
		.lable-top-img{
			position:absolute;
			clip: rect(150px 450px 400px 250px);
    		margin: -150px 0 0 -350px;
			vertical-align: middle;
		}
		.lable-text{
			height:50px;
			font-size:2rem;color:#fff;
			line-height: 50px;
		}
		.lable-bottom-img{
			width:50px;height:50px;
			vertical-align: middle;
		}
	</style>
</head>
<body>
	<div id="content-bg">
		<div class="lable" style="background-color: #009cff">
			<div class="lable-top-div" >
				<img class="lable-top-img" src="img/welcome/lable_top_3.jpg">
			</div>
			<p class="lable-text" style="vertical-align: middle;">设置</p>
			<img class="lable-bottom-img"  src="svg/logo.svg">
		</div>
		<div class="lable" >
			<img class="lable-top-img" src="img/welcome/lable_top_3.jpg">
			<p class="lable-text" style="vertical-align: middle;">分享快乐</p>
			<img class="lable-bottom-img"  src="svg/logo.svg">
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
</html>