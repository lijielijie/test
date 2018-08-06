<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<title>分享快乐 记录点滴</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css" />
	<link rel="icon" href="../img/title.png" type="image/x-icon"/>
	<script type="text/javascript" src="../js/jquery-1.8.2.js"></script>
	<style type="text/css">
		body{
			background-image: url("../img/bg/bg3.jpg");background-repeat:no-repeat; 
			display: flex;
   			align-items: center;
    		justify-content: center;
    		flex-direction: column;
		}
		#content-title{
			display: flex;
    		flex-direction: row;
		}
		#content{
			display:none;
			background-color:#fff;
    		flex-direction: row;
    		width: 100%;height: 100%;
		}
		.lable{
			height:350px;width:200px;
    		background-color: #28a745;
    		margin:1rem;
    		text-align: center;
    		border-radius: .5rem;
		}
		.lable:hover{
			cursor: pointer;
			text-shadow: 0 0 10px #fff0a0;
		}
		
		.lable-top-div{
			position:absolute;
			height:250px;width:200px;
		}
		.lable-top-img{
			position: absolute;
		}
		.lable-text{
			margin-top: 280px;height:50px;
			font-size:2rem;font-weight: 600;color: gold;
			line-height: 50px;
			font-family: "宋体";
		}
		.lable-bottom-img{
			width:50px;height:50px;
			vertical-align: middle;
		}
		
		#lable1:hover{
			box-shadow: 0 0 10px orange,0 0 10px orange,0 0 30px #fff,0 0 40px #fff;
		}
		#lable-top-img1{
			width: 100%;
            clip-path: inset(0% round .5rem .5rem 0 0);
    		margin: 0px 0 0 -100px;
		}
		
		
		#lable2:hover{
			box-shadow: 0 0 10px gold,0 0 20px gold ,0 0 30px #fff;
		}
		#lable-top-img2{
			width: 120%;
    		clip-path: inset(-1px 20px 0 20px round .5rem .5rem 0 0);
    		margin: 0px 0 0 -120px;
		}
		
		
		#lable3:hover{
			box-shadow: 0 0 10px #262125,0 0 20px #262125 ,0 0 30px #fff,0 0 40px #fff;
		}
		#lable-top-img3{
			width: 100%;
			clip-path: inset(0% round .5rem .5rem 0 0);
    		margin: 0px 0 0 -100px;
		}
		
		
		#lable4:hover{
			box-shadow: 0 0 10px #c28896,0 0 20px #fff ,0 0 30px #fff,0 0 40px #c28896;
		}
		#lable-top-img4{
			width: 100%;
    		clip-path: inset(0 0 30px 0 round .5rem .5rem 0 0);
    		margin: -1px 0 0 -100px;
		}
	</style>
</head>
<body>
	<div id="content-title">
		<div id="lable1" class="lable" lableName="guangchang" style="background-color: #433336">
			<div class="lable-top-div" >
				<img id="lable-top-img1" class="lable-top-img" src="../img/welcome/lable_top_1.jpg">
			</div>
			<p class="lable-text" >广场</p>
		</div>
		
		<div id="lable2" class="lable" lableName="chuangzuo" style="background-color: #000">
			<div class="lable-top-div" >
				<img id="lable-top-img2" class="lable-top-img" src="../img/welcome/lable_top_2.jpg">
			</div>
			<p class="lable-text" style="vertical-align: middle;">创作</p>
		</div>
		
		<div id="lable4" class="lable" lableName="jiayuan" style="background-color: #1e061e">
			<div class="lable-top-div" >
				<img id="lable-top-img4" class="lable-top-img" src="../img/welcome/lable_top_4.jpg">
			</div>
			<p class="lable-text">家园</p>
		</div>
		
		<div id="lable3" class="lable" lableName="shezhi" style="background-color: #262125">
			<div class="lable-top-div" >
				<img id="lable-top-img3" class="lable-top-img" src="../img/welcome/lable_top_3.jpg">
			</div>
			<p class="lable-text" style="vertical-align: middle;">设置</p>
		</div>
	</div>
	
	<div id="content">
		<a id="turn-left" class="turn" title="" style="flex: 1"></a>
		<iframe id="content-iframe1" name="contentIframe" src="../page/html/showArticle" style="flex: 8"></iframe>
		<a id="turn-left" class="turn" style="flex: 1"></a>
	</div>
</body>
<script type="text/javascript">
$('.lable').click(function() {
	$("#content-iframe1").attr("src",'../page/lable/'+$(this).attr('lableName'));
	$(".lable").animate({margin:'0rem'},2000);
	$("#content-title").animate({marginTop:'-18rem'},2000);
	$("#content").css('display','flex');
})
</script>
</html>