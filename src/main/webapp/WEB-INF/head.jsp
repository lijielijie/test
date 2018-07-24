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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>李杰的项目</title>
<style type="text/css">
#wait {
	left:45%;top:35%;
	width:64px;height: 64px;
	position: absolute;
	z-index: 999;
	background-color:#fff;
	display:none;
}
#north {
	background-color: rgba(45, 6, 47,0.9);
	top:0;
	width: 100%;height: 60px;
	position: absolute;
}
#content{
	top:60px;
	width: 100%;height: 93.5%;
	position: absolute;
}
#north-left {
	position: absolute;
	left: 0%;
	width: 45%;height: 80%;
}
#north-center {
	position: absolute;
	left: 40%;
	width: 45%;height: 100%;
}
#north-right {
	position: absolute;
	left: 85%;
	width: 15%;height: 100%;
	display: inline;
}
#north-center a {
	font-size: 20px;
	line-height: 60px;
	text-align: center;
	width: 24%;height: 100%;
	text-decoration: none;
	color: #fff;
	display: inline-block;
}
#north-center a:hover {
	background-color: red;
}
#north-right a {
	font-size: 20px;
	line-height: 60px;
	text-decoration: none;
	color: gold;
}
#north-right a:hover {
	color: yellow;
}
#north-right #user-img {
	display: inline;
}
#north-right #user {
	display: inline;
	float: right;
}
#north-right img {
	margin-top: 0vmin;
	height: 8vmin;width: 8vmin;
	border-radius: 4vmin;
	vertical-align: middle;
}
#north-right #upload-img {
	line-height: 5vmin;
	text-align: center;
	margin-left: -6.5vmin;
	height: 4vmin;width: 11vmin;
	border-radius: 1vmin;
	color: #ea67e9;
	background-color: #2d062f;
	font-size: 2vmin;
	display: none;
}
#up-img-window {
	left: 62vmin;top: 20vmin;
	width: 75vmin;height: 40vmin;
	position: absolute;
	background-color: #2d062f;
	z-index: 999;
	padding: 1vmin;
	box-shadow: 3px -3px 3px #000;
	display: none;
}
#show-img {
	width: 33vmin;height: 40vmin;
}
#img-file {
	width: 40vmin;height: 3vmin;
	margin-left: 35vmin;margin-top: -35vmin;
}
#up-img-but {
	width: 10vmin;height: 5vmin;
	margin-left: 60vmin;margin-top: -10vmin;
}
#hide-img-but {
	width: 10vmin;height: 5vmin;
	margin-left: 35vmin;margin-top: -10vmin;
}
.ao,.tu,.ei,.ha {
 	display: inline-block;
 	width: 0;
  	font-size: 14px;
  	line-height: 18px;
  	color: #2d062f;
  	
}
.ao{
	margin-top: 3px;	
  	margin-left: 5px;
}
.tu {
	direction: rtl;
 	margin-left: 75px;
}
.ei{
  	margin-left: 5px;
}
.ha {
	direction: rtl;
 	margin-left: 70px;
}
.ao:before,.tu:before,.ei:before,.ha:before {
  	font-family: Consolas, Monaco, monospace;
}
.ao:before {
	outline: 3px solid #00dbff;
  	content: "lij+++ hao+ yu";
}
.tu:before {
	outline: 3px solid #fb00ff;
  content: "ff +dff +++daa";
}
.ei:before {
	outline: 3px solid #00ff5a;
  	content: "love月love";
}
.ha:before {
	outline: 3px solid #ff5e00;
  	content: "yue love+ yue";
}
#music-wangyi{
	z-index:1;
	left:200px;
	top:-18px;
	width:80px;
	height:80px;
	position: fixed;
	overflow: hidden;
}
#music-img{
	z-index:1;
	left:200px;
	top:0vmin;
	width:60px;
	height:60px;
	position: fixed;
	overflow: hidden;
}
#music-wangyi:hover{
	width:300px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<link rel="stylesheet" type="text/css" href="css/webuploader.css"/>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/webuploader.js"></script>
</head>
<body>
	<iframe id ="music-wangyi" src="">播放歌曲</iframe>
	<img id ="music-img" src="img/music.png"/>
	<div id="wait">
		<img alt="请稍候" style="left: 100%;top: 100%;" src="svg/loading-spinning-bubbles.svg">
	</div>
	<!-- 所有页面的头导航-->
	<div id="north">
		<div id="north-left">
			<span class="ao"></span>
			<span class="tu"></span>
			<span class="ei"></span>
			<span class="ha"></span>
			
		</div>
		<nav id="north-center"> 
			<a onclick="ifArticleSave('page/html/showArticle');">文章列表</a> 
			<a onclick="ifArticleSave('page/html/writeArticle');">编写文章</a> 
			<a onclick="">建造中</a> 
			<a onclick="">待建造</a>
		</nav>
		<div id="north-right">
			<c:choose>
				<c:when test="${sessionScope.loginFlag}">
					<div id="user-img">
						<!--  img id="show-user-img" alt="请上传您的头像" style="background:#2d062f" src="download/userImage" /--> 
						<a id="upload-img" onclick="showImgWindow()">更&nbsp换（服务器版本暂不支持）</a>
					</div>
					<i style="float: right;" onmousedown="showOutline()"onmouseout="hideOutline()">调试</i>
					<div id="user">
						<a id="user-name" style=" float: right;">${user.ownname}</a>
					</div>
				</c:when>
				<c:when test="${!sessionScope.loginFlag}">
					<a style=" float: right;" href="user/loginOut">登录&nbsp;&nbsp;&nbsp;&nbsp;</a>
				</c:when>
			</c:choose>
		</div>
	</div>
	<!-- 弹出的窗体-->
	<div id="up-img-window">
		<img alt="请上传您的头像" id="show-img" src="">
		<input type="file" id="img-file" name="imgFile" onchange="getImgURL(this)" />
		<button type="button" id="up-img-but" >上传</button>
		<button type="button" id="hide-img-but" onclick="showImgWindow()">取消</button>
	</div>
	<div id="content">
		<iframe id="content-iframe" name="contentIframe" style="width: 100%;height: 100%;" src="page/html/showArticle"></iframe>
	</div>
	<script type="text/javascript">
		var loginName = $("#user-name").text();
		$("#user").hover(function() {//替换用户名与退出	
			if (loginName == $("#user-name").text()) {
				$("#user-name").text('退出');
				$("#user-name").attr("href", "user/loginOut");
			} else {
				$("#user-name").text(loginName);
				$("#user-name").attr("href", "");
			}
		});
		$("#user-img").hover(function() {//显示上传头像按钮$
			$("#pause").trigger("click");
			$("#upload-img").toggle();
		});
		//调试边框
		function showOutline() {
			//$("#wait").show();
			[].forEach.call($("*"), function(a) {
				a.style.outline = "2px solid #"
						+ (~~(Math.random() * (1 << 24))).toString(16);
			})
		}
		//调试边框
		function hideOutline() {
			[].forEach.call($("*"), function(a) {
				a.style.outline = "0px";
			})
		}
		//开关上传图片窗体		
		function showImgWindow() {
			if ($('#up-img-window').is(":hidden")) {//上传图片窗体图片栏置为当前头像图像				
				$("#show-img").attr("src", $("#show-user-img").attr("src"));
				$('#up-img-window').show();
			} else {
				$('#up-img-window').hide();
			}
		}

		//获取图片路径
		function getImgURL(node) {
			if (node.files && node.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#show-img").attr("src", e.target.result);
				};
			}
			reader.readAsDataURL(node.files[0]);
		}

		//上传图片
		$("#up-img-but").click(function() {
			var formData = new FormData();//初始化一个FormData对象
			formData.append("file", $("#img-file")[0].files[0]);//将文件塞入FormData
			$("#wait").show();
			$.ajax({
				url : "upload/userImage",
				type : "POST",
				data : formData,
				processData : false, // 告诉jQuery不要去处理发送的数据
				contentType : false, // 告诉jQuery不要去设置Content-Type请求				
				success : function(responseText) {
					if (1==responseText) {
						alert("头像已成功上传至hadoop");
						$('#up-img-window').hide();
						$("#show-user-img").attr("src",$("#show-img").attr("src"));
					}else{
						alert("上传失败");
					}
				}
			});
			$("#wait").hide();
		});
		//通过导航iframe跳转到指定页面		
		$("#north-center a").on("click",function(e){
			  $("#content-iframe").attr("src",$(this).attr("href"));
			  return false;
		});
		//通过导航iframe跳转到音乐页面		
		$("#music-img").on("click",function(e){
			$("#music-img").hide();
			$("#music-wangyi").attr("src","https://music.163.com/outchain/player?type=2&id=5270275&auto=0&height=66");
			return true;
		});
		
		var color1,color2,color3,color4;
		var ao=$(".ao")[0];
		var tu=$(".tu")[0];
		var ei=$(".ei")[0];
		var ha=$(".ha")[0];
		var timer=setInterval(function() {  
			color4=color3;
			ha.style.outline = "2.4px solid "+color4 ;
			color3=color2;
			ei.style.outline = "2.4px solid "+color3 ;
			color2=color1;
			tu.style.outline = "2.4px solid "+color2 ;
			color1="#"+(~~(Math.random() * (1 << 24))).toString(16);
			ao.style.outline = "2.4px solid "+color1 ;
        },1000);
		
		//防止误跳出编辑页面
		function ifArticleSave(src){
			if (document.getElementById("content-iframe").src=='http://127.0.0.1:8080/test1/page/html/writeArticle') {
				if (document.getElementById("content-iframe").contentWindow.document.getElementsByClassName("text-tag").length>0) {//如果用户新增了文本输入框，就校验
					var r=confirm("您还没编写完并保存文章，确定离开编辑页面？");
				  	if (r==false){//选择取消
				  		return;
				  	}
				}
			}
			document.getElementById("content-iframe").src=src;//允许跳转
		}
	</script>
</body>
</html>