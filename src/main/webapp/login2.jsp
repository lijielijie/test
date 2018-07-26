<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<title>欢迎</title>
	<link rel="stylesheet" type="text/css" href="css/index.css" />
	<link rel="stylesheet" type="text/css" href="css/webuploader.css" />
	<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="js/webuploader.js"></script>
	<style type="text/css">
		body{
			background-image: url("img/login-bg.png");
			display: flex;
   			align-items: center;
    		justify-content: center;
    		flex-direction: column;
		}
		#content-bg{
			margin-top: -20%;
			display: flex;
    		flex-direction: column;
			color:white;
		}
		#content-title{
			font-size:2rem;
			color:white;
			display: inline-block;
    		text-shadow: 0 0 20px #0170ff,0 0 20px #0170ff,0 0 20px #0170ff;;
		}
	</style>
</head>
<body>
	<div id="content-bg">
		<div style="margin-bottom: 1rem;">
			<img alt="哈哈哈" style="width:10%;height: 10%;vertical-align: middle;" src="svg/logo.svg">
			<span id="content-title" style="vertical-align: middle;">分享快乐 记录点滴</span>
		</div>
		<form action="" method="post">
			<input type="text" id="username" name="un" class="username" placeholder="请输入姓名" /> 
			<input type="password" id="password" name="pw" class="password" placeholder="请输入密码" />
			<button type="button" id="btn-login">登 录</button>
			<button type="button" id="to-register">注册</button>
			<span id="info1" style="color:rgb(2, 143, 212);"></span>
		</form>
		<form style="display: none;" method="post">
			<input type="text" id="reg-username" name="un" class="username" placeholder="请输入姓名" /> 
			<input type="password" id="reg-password" name="pw" class="password" placeholder="请输入密码" />
			<input type="password" id="reg-password1" name="pw1" class="password" placeholder="请再次输入密码" />
			<button type="button" id="to-register">注册</button>
			<button type="reset" class="reset">重 置</button>
			<span id="info2" style="color:rgb(2, 143, 212);"></span>
		</form>
	</div>
</body>
<script type="text/javascript">
//登录事件
$('#btn-login').click(function() {
	var username = $('#username').val();
	var password = $('#password').val();
	if(username==""){
     $("#username").fadeOut("fast");
     $("#username").fadeIn("fast");
     return false;
   }
   if(password==""){
     $("#password").fadeOut("fast");
     $("#password").fadeIn("fast");
    return false;
   }
   $.post('user/login', {"name" : username,"pass" : password}, 
	function(data) {//发送异步请求，data是服务器返回的结果
		if (data==1) {
			 $('#info1').text("登录成功  即将跳转至首页");
			 setTimeout("javascript:location.href='welcome.jsp'", 2000);
		}
		if (data==-1) {
			 $('#info1').text("您已登录  即将跳转至首页");
			 setTimeout("javascript:location.href='welcome.jsp'", 2000);
		}
		if (data==2) {
			 $('#info1').text("没有此用户，请先注册");
		}
		if (data==3) {
			 $('#info1').text("密码错误");
		}
		$("#info1").fadeIn("fast");
		$('#password').val("");
	});
	 $("#info1").fadeOut("slow");
	return false;
});


</script>
</html>