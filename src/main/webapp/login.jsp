<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>欢迎</title>
<style type="text/css">

body {
	margin: 0px;
	overflow: hidden;
	font-weight: bold;
	height: 100%; 
}

#loginform {
	height: 600px;
	width: 400px;
	overflow: hidden;
	position: absolute;
	top: 40%;
	left: 42%;
	margin: -102px auto auto -82px;
	z-index: 2;
}

#registerform {
	display: none;
	height: 600px;
	width: 400px;
	overflow: hidden;
	position: absolute;
	top: 30%;
	left: 42%;
	margin: -102px auto auto -82px;
	z-index: 2;
}

form {
	height: 100%;
	width: 100%;
	overflow: hidden;
	position: absolute;
	top: 9%;
	left: 4%;
	margin: 0px auto auto 0px;
	z-index: 3;
}

input {
	border:none;
	width: 94%;
	height: 8%;
	box-shadow:0 0 5px #0ff;
	font-size: 20px;
	float: left;
	margin: 15px auto;
	background-color: rgba(0, 0, 0, 0.65);
	border-radius: 10px;
	color:#fff;
}

button {
	border:none;
	display: initial;
	width: 30%;
	height: 8%;
	box-shadow: 2px 2px 2px #E4B2E3;
	font-size: 25px;
	font-family: "楷体";
	border: 1px solid #CBC284;
	line-height: 25px;
	background-color: rgb(2, 143, 212);
	color: #fff;
	text-decoration: none;
	border-radius: 10px;
	margin: 10px auto;
}
button:hover{
	background-color: #f00;
}
.back {
	display: initial;
	width: 130px;
	height: 40px;
	box-shadow: 2px 2px 2px #E4B2E3;
	font-size: 25px;
	font-family: "楷体";
	border: 1px solid #CBC284;
	line-height: 25px;
	background-color: rgba(85, 83, 179, 0.0);
	color: #311681;
	text-decoration: none;
	border-radius: 10px;
}

#err {
	top: 38%;
	left: -4%;
	display: none;
}

.none {
	top: 62%;
	left: 0%;
	display: none;
}

.has {
	top: 62%;
	left: 0%;
	display: none;
}

span {
	width: 100%;
	height: 40px;
	position: absolute;
	color: #fff;
	font-size: 30px;
	font-family: "楷体";
	text-align: center;
}
</style>

<script src="js/three.min.js"></script>
<script src="js/jquery-1.8.2.js"></script>

</head>
<body>
	<img id="bg"  width="100%" height="110%" style="right: 0; bottom: 0;position: absolute; top: 0;z-index: -1;" />
	<div id="loginform">
		<span class="login">---------在此登录--------</span>
		<form action="" method="post">
			<input type="text" id="username" name="un" class="username"
				placeholder="请输入姓名" /> <input type="password" id="password"
				name="pw" class="password" placeholder="请输入密码" />
			<button type="button" id="btn-login">登 录</button>
			<button type="reset" class="reset">重 置</button>
			<button type="button" id="to-register">去注册</button>
			<span id="err" style="color:rgb(2, 143, 212);"></span>
		</form>
	</div>
	<div id="registerform">
		<span class="login">-------在此注册--------</span>
		<form action="" method="post">
			<input id="checkword" name="cw" class="checkword"
				placeholder="请输入邀请码" /> <input id="username1" name="un1"
				class="username1" placeholder="请输入姓名" /> <input id="password1"
				name="pw1" class="password1" placeholder="请输入密码" /> <input
				id="password2" name="pw2" class="password2" placeholder="请再次输入密码" />
			<button type="submit" id="btn-register">注 册</button>
			<button type="reset" class="reset">重 置</button>
			<button type="button" id="to-login">去登陆</button>
			<span class="none">请向李杰申请正确的邀请码</span> <span class="has">该用户名已存在</span>
		</form>
	</div>
	<script type="text/javascript">
	
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
			 $('#err').text("登录成功  即将跳转至首页");
			 setTimeout("javascript:location.href='welcome.jsp'", 2000);
		}
		if (data==-1) {
			 $('#err').text("您已登录  即将跳转至首页");
			 setTimeout("javascript:location.href='welcome.jsp'", 2000);
		}
		if (data==2) {
			 $('#err').text("没有此用户，请先注册");
		}
		if (data==3) {
			 $('#err').text("密码错误");
		}
		$("#err").fadeIn("fast");
		$('#password').val("");
	});
	 $("#err").fadeOut("slow");
	return false;
});

//改变背景颜色，实时刷新时间单位为毫秒 
var color=0;
var r=true;
setInterval('changeColor()',100);    
function changeColor(){  
	color=parseInt($("#bg").css('background-color').split(',')[1]);
	if(color==220){
		r=false;
	}else if(color==50){
		r=true;
	}
	color=r?color+2:color-2;
	$("#bg").css('background-color','rgba('+120+','+color+','+color+',0.3'+')') ; 
}   

$('#btn-register').click(function() {
	var username1 = $('#username1').val();
	var password1 = $('#password1').val();
	var password2 = $('#password2').val();
	var checkword = $('#checkword').val();
	if(checkword==""){
     $(".checkword").fadeOut("fast");
     $(".checkword").fadeIn("fast");
    return false;
   }
	if(username1==""){
     $(".username1").fadeOut("fast");
     $(".username1").fadeIn("fast");
     return false;
   }
   if(password1==""){
     $(".password1").fadeOut("fast");
     $(".password1").fadeIn("fast");
    return false;
   }
   if(password2==""){
     $(".password2").fadeOut("fast");
     $(".password2").fadeIn("fast");
    return false;
   }
   if(password1!=password2){
     $(".password1").fadeOut("fast");
     $(".password2").fadeOut("fast");
     $(".password1").fadeIn("fast");
     $(".password2").fadeIn("fast");
    return false;
   }
    return true;
});
//实时校验邀请码
$('.checkword').change(function() {
	var checkword = $('#checkword').val();
	$.post('user/checkOrderWord', {"cw" : checkword}, 
	function(data) {//发送异步请求，data是服务器返回的结果
		if (data=="0") {
			$(".none").fadeIn("fast");
			$('.checkword').val("");
			return false;
		}
	});
	$(".none").fadeOut("slow");
    return true;
});

//校验已存在用户
$('.username1').change(function() {
	var username1 = $('#username1').val();
	var checkword = $('#checkword').val();
	$.post('user/checkRegister', {
				"un1" : username1,
				"cw" : checkword
			}, function(data) {//发送异步请求，data是服务器返回的结果
				if (data == "0") {
					$(".has").fadeIn("fast");
					window.location.href = '#';
					$('.username1').val("");
					return false;
				}
			});
			$(".has").fadeOut("slow");
			return true;
		});
		$(function() {
			$("#to-register").click(function() {
				$("#loginform").fadeOut("fast");
				$("#registerform").fadeIn("fast");
			});
			$("#to-login").click(function() {
				$("#registerform").fadeOut("fast");
				$("#loginform").fadeIn("fast");
			});
		});

		var container;
		var camera, scene, projector, renderer;
		
		var PI2 = Math.PI * 2;
		var programFill = function(context) {
			context.beginPath();
			context.arc(0, 0, 1, 0, 0, true);
			context.closePath();
			context.fill();
		}

		var programStroke = function(context) {
			context.lineWidth = 0.05;
			context.beginPath();
			context.arc(0, 0, 1, 0, Math.PI, true);
			context.closePath();
			context.stroke();
		}

		var mouse = {
			x : 0,
			y : 0
		}, INTERSECTED;

		init();
		animate();

		function init() {

			container = document.createElement('div');
			container.id = 'bgc';
			container.style.position = 'relative';
			container.style.zIndex = '0';
			document.body.appendChild(container);

			camera = new THREE.PerspectiveCamera(70, window.innerWidth
					/ window.innerHeight, 1, 10000);
			camera.position.set(0, 300, 500);

			scene = new THREE.Scene();

			for (var i = 0; i < 50; i++) {

				var particle = new THREE.Particle(
						new THREE.ParticleCanvasMaterial({
							color : Math.random() * 0x808080 + 0x808080,
							program : programStroke
						}));
				particle.position.x = Math.random() * 800 - 400;
				particle.position.y = Math.random() * 800 - 400;
				particle.position.z = Math.random() * 800 - 400;
				particle.scale.x = particle.scale.y = Math.random() * 10 + 10;
				scene.add(particle);

			}

			projector = new THREE.Projector();

			renderer = new THREE.CanvasRenderer();
			renderer.setSize(window.innerWidth, window.innerHeight);

			container.appendChild(renderer.domElement);

			document.addEventListener('mousemove', onDocumentMouseMove, false);

			//

			window.addEventListener('resize', onWindowResize, false);

		}

		function onWindowResize() {

			camera.aspect = window.innerWidth / window.innerHeight;
			camera.updateProjectionMatrix();

			renderer.setSize(window.innerWidth, window.innerHeight);

		}

		function onDocumentMouseMove(event) {

			event.preventDefault();

			mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
			mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;

		}

		//

		function animate() {

			requestAnimationFrame(animate);

			render();

		}

		var radius = 600;
		var theta = 0;

		function render() {

			// rotate camera

			theta += 0.2;

			camera.position.x = radius * Math.sin(theta * Math.PI / 360);
			camera.position.y = radius * Math.sin(theta * Math.PI / 360);
			camera.position.z = radius * Math.cos(theta * Math.PI / 360);
			camera.lookAt(scene.position);

			// find intersections

			camera.updateMatrixWorld();

			var vector = new THREE.Vector3(mouse.x, mouse.y, 0.5);
			projector.unprojectVector(vector, camera);

			var ray = new THREE.Ray(camera.position, vector.subSelf(
					camera.position).normalize());

			var intersects = ray.intersectObjects(scene.children);

			if (intersects.length > 0) {

				if (INTERSECTED != intersects[0].object) {

					if (INTERSECTED)
						INTERSECTED.material.program = programStroke;

					INTERSECTED = intersects[0].object;
					INTERSECTED.material.program = programFill;

				}

			} else {

				if (INTERSECTED)
					INTERSECTED.material.program = programStroke;

				INTERSECTED = null;

			}

			renderer.render(scene, camera);
		}
	</script>
</body>
</html>