<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<title>分享快乐 记录点滴</title>
	<link rel="stylesheet" type="text/css" href="/css/index.css" />
	<link rel="icon" href="../img/title.png" type="image/x-icon"/>
	<script type="text/javascript" src="/js/jquery-1.8.2.js"></script>
	<style type="text/css">
		body{
			background-image: url("/img/bg/bg3.jpg");background-repeat:no-repeat;
			display: flex;
   			align-items: center; /* 与flex-direction共同使用 column靠右   row靠下*/
    		justify-content: center;
    		flex-direction: column;
		}
		#content-title{
			display: flex;
    		flex-direction: row;
		}
		#content{
			background-image: url("../img/bg/bg1.jpg");background-repeat:no-repeat;
			display:flex;
			background-color:#fff;
    		flex-direction: row;
    		width: 100%;height: 0%;
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
		.turn{
			margin-top: 20%;
    		height: 4rem;width: 4rem;
    		border-radius: 2rem;
			background-color: black;
		}
		#tip{
    		margin: 1rem;
    		height: 4rem;width: 4rem;
    		background-color: black;
		}
		
.small_01 {
	animation:small_01 1s ease-out;
	animation-iteration-count:1;
	animation-fill-mode:forwards ;
}
.small_01:active {
	background-color: #c8513e !important;
}
.small_02{
	animation:small_02 1s infinite;
	animation-iteration-count:1;
	animation-fill-mode:forwards ;
}
.small_03{
	animation:small_03 1s infinite;
	animation-iteration-count:1;
	animation-fill-mode:forwards;
	border-top: 1px solid #fff;
}		
@keyframes small_01{
	from {margin:1rem;}to {margin:.5rem;}
}	
@keyframes small_02{
	from {margin-top:0rem;}to {margin-top:-18rem;}
}	
@keyframes small_03{
	from {opacity:0;height: 0%;}to {opacity:1;height: 103%;}
}
	</style>
</head>
<body>
	<div id="content-title">
		<div id="lable1" class="lable" lableName="guangchang" style="background-color: #433336">
			<div class="lable-top-div" >
				<img id="lable-top-img1" class="lable-top-img" src="/img/welcome/lable_top_1.jpg">
			</div>
			<p class="lable-text" >广场</p>
		</div>
		
		<div id="lable2" class="lable" lableName="chuangzuo" style="background-color: #000">
			<div class="lable-top-div" >
				<img id="lable-top-img2" class="lable-top-img" src="/img/welcome/lable_top_2.jpg">
			</div>
			<p class="lable-text" style="vertical-align: middle;">创作</p>
		</div>
		
		<div id="lable4" class="lable" lableName="jiayuan" style="background-color: #1e061e">
			<div class="lable-top-div" >
				<img id="lable-top-img4" class="lable-top-img" src="/img/welcome/lable_top_4.jpg">
			</div>
			<p class="lable-text">家园</p>
		</div>
		
		<div id="lable3" class="lable" lableName="shezhi" style="background-color: #262125">
			<div class="lable-top-div" >
				<img id="lable-top-img3" class="lable-top-img" src="/img/welcome/lable_top_3.jpg">
			</div>
			<p class="lable-text" style="vertical-align: middle;">设置</p>
		</div>
		
	</div>
	
	<div id="content">
		<a id="turn-left" class="turn" title="" style="z-index:999;display: none"></a>
		<iframe id="content-iframe1" name="contentIframe" src="" style="flex: 20"></iframe>
		<a id="turn-right" class="turn" style="z-index:999;display: none"></a>
	</div>
</body>
<script type="text/javascript">
$('.lable').click(function() {
	$("#content-iframe1").attr("src",'../page/lable/'+$(this).attr('lableName'));
	$(".lable").attr('class','lable small_01');//添加新类，使新类的延时特效生效
	$("#content-title").attr('class','small_02');
	$("#content").attr('class','small_03');
})
$('#content').click(function() {
	$("#content-iframe1").attr("src",'../page/lable/'+$(this).attr('lableName'));
	$("#content-title").attr('class','');
	$(".lable").attr('class','lable');
	$("#content").attr('class','');
})

</script>
</html>