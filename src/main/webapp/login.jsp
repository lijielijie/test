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
			background-image: url("img/login-bg.png");
			display: flex;
   			align-items: center;
    		justify-content: center;
    		flex-direction: column;
		}
		#content-bg{
			margin-top: -10rem;
			display: flex;
    		flex-direction: column;
			color:white;
		}
		.content-title{
			font-size:2rem;
			color:white;
			display: inline-block;
    		text-shadow: 0 0 20px #0170ff,0 0 20px #0170ff;
		}
		.form-input{
			display:block;
    		width: 21rem;
    		padding: .5rem;
    		color: #495057;font-size: 1rem;
    		border: 1px solid #b800fe;
    		border-radius: .25rem;
    		border-left: 5px solid red;
    		transition: border-color .10s ease-in-out,box-shadow .10s ease-in-out;
    		margin-bottom: 1rem;
		}
		.form-button{
			flex: 1;
			height:2.5rem;
			color: #fff;line-height:2rem;font-size: 1rem;
    		background-color: #28a745;
    		margin:1px;
		}
	</style>
</head>
<body>
	<div id="content-bg">
		<div style="margin-bottom: 1rem;">
			<span class="content-title" style="vertical-align: middle;">分享快乐&nbsp;</span>
			<img alt="哈哈哈" style="width:3rem;height: 3rem;vertical-align: middle;" src="svg/logo.svg">
			<span class="content-title" style="vertical-align: middle;">&nbsp;记录点滴</span>
		</div>
		<form id ="form-login" action="" method="post" >
			<input type="text" id="username" name="un" class="form-input" placeholder="请输入用户名" /> 
			<input type="password" id="password" name="pw" class="form-input" placeholder="请输入密码" />
			<div style="display: flex;width: 100%">
				<button type="button" id="btn-login" class="form-button">登 录</button>
				<button type="reset"  class="form-button">重 置</button>
			</div>
			<b id="info1" style="color:rgb(2, 143, 212);"></b>
		</form>
		<form id ="form-register" style="display: none;" method="post">
			<input type="text" id="reg-username" name="un" class="form-input" placeholder="请输入姓名" /> 
			<input type="password" id="reg-password" name="pw" class="form-input" placeholder="请输入密码" />
			<input type="password" id="reg-password1" name="pw1" class="form-input" placeholder="请再次输入密码" />
			<div style="display: flex;width: 100%">
				<button type="button" id="btn-register" class="form-button">注册</button>
				<button type="reset"  class="form-button">重 置</button>
				<button type="button" id="to-login" class="form-button">登 录</button>
			</div>
			<b id="info2" style="color:rgb(2, 143, 212);"></b>
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
     return;
	}
   if(password==""){
     $("#password").fadeOut("fast");
     $("#password").fadeIn("fast");
    return;
   }
   $.post('user/login', {"name" : username,"pass" : password}, 
	function(data) {
		if (data==1) {
			 $('#info1').text("登录成功 即将跳转至首页");
			 setTimeout("javascript:location.href='welcome.jsp'", 2000);
		}
		if (data==-1) {
			 $('#info1').text("您已登录 即将跳转至首页");
			 setTimeout("javascript:location.href='welcome.jsp'", 2000);
		}
		if (data==2) {
			 $('#info1').text("没有此用户 请先注册");
			 $('#username').val("");$('#password').val("");
		}
		if (data==3) {
			 $('#info1').text("密码错误");
			 $('#password').val("");
		}
		$("#info1").fadeIn("fast");
	});
	return;
});
//input获得焦点事件
$(".form-input").focus(function(){
	$(this).css("border-color","gold");
});
//input失去焦点事件
$(".form-input").blur(function(){
	if($(this).val()){
		$(this).css("border-color","#28a745");
	}else{
		$(this).css("border-color","#b800fe");
	};
});
//input清空事件
$("button[type='reset']").click(function(){
	$(".form-input").css("border-color","#b800fe");
});
</script>
</html>