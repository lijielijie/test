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
<title>编辑文章</title>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<style>
html {
	font-size: 20px;
	overflow: hidden;
}

* {
	font-family: "微软雅黑";
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}

#panle {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
}

#centent {
	flex: 3;
	display: flex;
	flex-direction: row;
}

#centent-util>*, #centent-right>* ,#all-text-tag>*{
	margin-left: 1rem;
}

#articleTitle {
	height: 2rem;
	font-size: 1rem;
	font-weight: bold;
	margin-top: 0.5rem;
	text-align: center;
	border: hidden;
	background-color: rgba(255, 255, 255, 0.8);
	border-radius: 0.5rem;
	outline: medium;
}

p {
	width: 100%;
	height: 2rem;
	line-height: 2rem;
	font-size: 1rem;
	font-weight: bold;
}
button{
	cursor: pointer;
}
.util-button {
	width: 3.5rem;
	height: 1.8rem;
	margin-left: 0.5rem;
	margin-top: 0.5rem;
	border: hidden;
	border-radius: 0.5rem;
	outline: medium;
	background-color: rgba(255, 0, 255, 0.5);
}

.util-button:hover {
	width: 3.5rem;
	color: white;
	font-weight: bold;
	background-color: red;
}

select {
	width: 8rem;
	height: 1.8rem;
	margin-top: 0.5rem;
	border: hidden;
	border-radius: 0.5rem;
	outline: medium;
	background-color: rgba(0, 120, 255, 0.5);
	cursor: pointer;
}
textarea {
	font-size: 16px;
	margin-bottom: 0.2rem;
	resize: none;
	width: 100%;height: 60%;
}
::selection { 
	background:#a55c92; 
	color: #fff; 
}
img {
	width:auto;
	height: auto;
	border: 0.1rem #7fa2ff solid;
	margin-bottom: 0.2rem;
	background-size: 100% auto;
	max-width: 100%;
	color:gold;
}
.text-tags{
	flex: 1;
	width:50%;
	text-decoration: none;
	border-radius: 2rem 1rem 1rem 2rem;
	font-size: 16px;
	flex: 1;
	max-height: 2rem;
	margin-bottom: 0.5rem;
}

			.text-tag{
				margin-bottom:0.5rem;
				width:90%;height:2rem;
				display: flex;
			}
			.jump{
				width:25%;
				border:none;
				border-radius:100% 0% 0% 100%;
				background-color:#1eb7aa;
				color:white;outline: medium;
			}
			.text-tag-text{
				width:55%;
				border:none;
				background-color:#ff66ff;
				border-radius:0;
				color:black;outline: medium;
			}
			.text-tag-img{
				width:55%;
				border:none;
				background-color:#7fa2ff;
				border-radius:0;
				color:black;outline: medium;
			}
			.remove{
				width:15%;
				border:none;
				border-radius:0;
				background-color:#1eb7aa;
				color:white;outline: medium;
			}
			.radius {
				width:5%;
				border:none;outline: medium;
				background-color:rgb(165, 92, 146);
				background-image: radial-gradient(25px at 25px 20px, rgb(165, 92, 146) 50px, #1eb7aa 50px);//渐变线
			}
			.jump:hover {
				background-color:rgb(45, 6, 47);
			}
			.remove:hover{
				color:rgb(45, 6, 47);
			}
</style>
</head>

<body>
	<div id="panle">
		<div id="centent" class="grid" style="flex: 5;">
			<div id="centent-util" class="centent-grid" style="background-color: rgba(255, 0, 255, 0.2); flex: 1;">
				<p>工具栏</p>
				<button id="addInput" class="util-button" onclick="tagsAdd(0);">添加段落</button>
				<button id="addImage" class="util-button" onclick="tagsAdd(1);">添加图片</button>
				<select class="select" onchange="textareaFontSize(this)">
					<option value="16px">文本框文字16像素</option>
					<option value="10px">10像素</option>
					<option value="14px">14像素</option>
					<option value="18px">18像素</option>
					<option value="22px">22像素</option>
					<option value="26px">26像素</option>
					<option value="30px">30像素</option>
				</select> <select class="select" onchange="textareaColor(this)">
					<option value="#ffffff">编辑框背景色(白)</option>
					<option value="#c4e5fa">天空蓝</option>
					<option value="#f1bdfe">樱花紫</option>
					<option value="#59aea3">松石绿</option>
					<option value="#FF84BA">圣诞红</option>
					<option value="#f6bfdd">少女肤</option>
					<option value="#f2998a">珊瑚朱</option>
				</select> <select class="select" style="font-weight: bold;" onchange="textareaFontColor(this)">
					<option value="#000000">编辑框文字色(黑)</option>
					<option value="#006c54">萌葱色</option>
					<option value="#2a5caa">瑠璃色</option>
					<option value="#733C12">咖啡色</option>
					<option value="#b689b0">紫罗兰</option>
					<option value="#BF0A10">玫瑰红</option>
					<option value="#fdb933">郁金色</option>
				</select>
			</div>

			<div id="centent-center" class="centent-grid" style="display: flex;background-color:rgba(118, 8, 89, 0.66); flex: 5; overflow-x: hidden; overflow-y: auto;">
				<div id="all-centent" style="flex: 2; padding-left: 0.5rem;height: 90%;">
					<div id="centent-center-top" class="grid" style=" height: 3rem">
						<input type="text" id="articleTitle" placeholder="请输入标题" maxlength="30"  onchange="javaScript:$('#noneTitle').hide();"/>
					</div>
					<div id="all-text" >
						
						
						
					</div>
				</div>
				<div  style="flex: 1;">
						<div id="all-text-tag" style="position: fixed; width: 20%;height:90%; flex;flex-direction: column;overflow-x: hidden;overflow-y: auto; ">
							<p style="height:2rem;">导航栏</p>
							
							
						</div>
					</div>
			</div>

			<div id="centent-right" class="centent-grid" style="background-color: rgba(255, 0, 255, 0.2); flex: 1;">
				<p>保存栏</p>
				<select class="select" id="articleRole">
					<option value="public">文章访问权限(公开)</option>
					<option value="private">私有</option>
				</select> 
				<select class="select" id="articleType" style="background-color: #6C6D6F;">
					<option value="#ffffff">文章分类(暂未开放)</option>
				</select>
				<button id="saveArticle" class="util-button" style="color: white" onclick="saveArticle();">保存文章</button>
				<br>
				<i id="noneText" style="color:#020458;display: none;">好歹写点内容啊!!</i>
				<i id="noneTitle" style="color:#020458;display: none;">还没给我起名字呢</i>
			</div>
		</div>
		<div id="bottom" class="grid" style="background-color: rgb(45, 6, 47); height: 1.6rem;overflow: hidden;margin-bottom: 0.5rem;color:white;font-size: 14px;">
			<table border="0" cellspacing="0" cellpadding="0" >
				<tbody>
    				<tr>
        				<td id="header_demo1" nowrap class="scroll-text" >
           				文本输入框限制了高度 不想出现下拉框时 点击新增段落按钮新增文本框&nbsp;&nbsp;
           				|&nbsp;&nbsp;
           				导航栏可以定位和删除文本框 也可以在里面输入自定义标签说明&nbsp;&nbsp;
           				|&nbsp;&nbsp;
           				对页面排版或者功能的合理可行建议可以联系李杰(QQ:465012217)调整&nbsp;&nbsp;
           				|&nbsp;&nbsp;
           				</td>
        				<td id="header_demo2" nowrap class="scroll-text" ></td>
    				</tr>
    			</tbody>
			</table>
		</div>
	</div>
	<script>
	
	//下拉框设置文本格式事件
		function textareaColor(e) {
			var color = e.options[e.selectedIndex].value;
			$(e).css("background-color", color);
			$("textarea").css("background-color", color);
		}

		function textareaFontSize(e) {
			var size = e.options[e.selectedIndex].value;
			$(e).css("font-size", size);
			$("textarea").css("font-size", size);
		}

		function textareaFontColor(e) {
			var size = e.options[e.selectedIndex].value;
			$(e).css("color", size);
			$("textarea").css("color", size);
		}

		//添加文本框和标签
		var textareaNum=0;//textarea数量
		var imageSum=0;//image数量
		function tagsAdd(type){
			 
			 
			 
			 $('#noneText').hide();//隐藏空内容提示
			 if (type==0) {
				//var textareaHtml="<textarea class='textarea  article-node' id=textarea"+textareaNum+" cols='20' ></textarea>";//新文本框
				var texttagHtml="<button class='jump' name='textarea"+
								textareaNum+
								"' onclick='tagsJump(this)'>跳转</button><input type='text' class='text-tag-text' /><button class='remove' name='textarea"+
								textareaNum+
								"' onclick='tagsRemove(this)'>删除</button><button class='radius'></button>";//新标签框
				
				var newchild_2 = document.createElement('textarea');
				newchild_2.classList.add("article-node");
				newchild_2.id="textarea"+textareaNum;
				newchild_2.cols=20;
				document.getElementById("all-text").appendChild(newchild_2);
				
				var newchild_1 = document.createElement('div');
				newchild_1.classList.add("text-tag");
				newchild_1.innerHTML =texttagHtml;
				document.getElementById("all-text-tag").appendChild(newchild_1);//添加新标签框
				
				textareaNum++;
			} else {
				//var imageHtml="<img class='image  article-node' id=image"+imageSum+" ondblclick='showImgWindow(this)' alt='双击图片框选取本地图片'></img>";//新图片框
				var imagetagHtml="<button class='jump' name='image"+
								imageSum+
								"' onclick='tagsJump(this)'>跳转</button><input type='text' class='text-tag-img'  /><button class='remove' name='image"+
								imageSum+
								"'  onclick='tagsRemove(this)'>删除</button><button class='radius'></button> <input type='file' id='fileimage"+
								imageSum+
								"' style='display: none' name='imgFile' onchange='getImgURL(this)'/>";//新标签框
				
				var newchild_2 = document.createElement('img');
				newchild_2.classList.add("article-node");
				newchild_2.id="image"+imageSum;
				newchild_2.alt='双击图片框选取本地图片';
				newchild_2.ondblclick=function() { 
					imageNode=this;
					return  $("#file"+imageNode.id).click();//拼接file元素的id 
				}//模拟图片上传，单击图片会返回file元素的点击事件
				document.getElementById("all-text").appendChild(newchild_2);
				
				
				var newchild_1 = document.createElement('div');
				newchild_1.classList.add("text-tag");
				newchild_1.innerHTML =imagetagHtml;
				document.getElementById("all-text-tag").appendChild(newchild_1);//添加新标签框
				
				imageSum++;
			}
		}
		function tagsJump(e){
			document.getElementById(e.name).scrollIntoView(false);
		}
		function tagsRemove(e){
			document.getElementById("all-text").removeChild(document.getElementById(e.name));
			e.parentNode.parentNode.removeChild(e.parentNode);
		}
		
		var imageNode;
		function showImgWindow(e) {
			
		}

		//获取file元素图片二进制给图片框加载图片
		function getImgURL(node) {
			if (node.files && node.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$(imageNode).attr("src", e.target.result);
				}
				reader.readAsDataURL(node.files[0]);
			}
		}
		
		var article="";//文字文本
		var imageNodeHtml="";//图片框的图片数据
		//获得正文文字和图片（图片先挨个上传服务器获得保存路径，返回拼接img加入正文）
		function saveArticle() {
			article="";
			var articleNodes=$(".article-node");
			for (var i = 0; i < articleNodes.length; i++) {
				var node=articleNodes.eq(i)[0];
				if(node.tagName=='IMG'){//获取图片框的图片文件，图片框里是图片2进制数据
					uploadImgFile(node);
					if (imageNodeHtml!="") {
						article+="<img class='image  article-node' src="+imageNodeHtml+" alt='图片链接失效'></img>"+"\n";
					}
				}else{//节点是texaera、
					if (node.value!="") {
						article+="<pre>"+node.value+"</pre>"+"\n";
					}
				}
			}
			uploadArticle(article.replace(/"/g ,"'"));
		}

		function uploadImgFile(imageNode) {
			var formData = new FormData();//初始化一个FormData对象
			var file=$("#file"+imageNode.id)[0].files[0];
			if (file==undefined) {//没有选择图片的image不加入
				imageNodeHtml= "";
				return;
			}
			formData.append("file", file);//将文件塞入FormData
			$.ajax({
				url : "upload/uploadArticleImage",
				type : "POST",
				data : formData,
				async:false, 
				processData : false, // 告诉jQuery不要去处理发送的数据
				contentType : false, // 告诉jQuery不要去设置Content-Type请求				
				success : function(imageSrc) {
					imageNodeHtml= imageSrc;
				}
			});
		}
		
		function uploadArticle(articleCentent) {//正式保存文章
			if ($('#articleTitle').val()=="") {
				$('#noneTitle').show();
				$('#articleTitle')[0].placeholder="请把我填上标题，谢谢！！";
				return;
			}
			if (articleCentent=="") {//没有内容提示错误
				$('#noneText').show();
				return;
			}
			var r=confirm("确认提交保存?");
		  	if (r==false){//选择取消
		  		return;
		  	}
			$.ajax({
				url : "article/uploadArticle",
				type : "POST",
				data : {articleRole:$('#articleRole option:selected').val(),articleCentent:articleCentent,title:$('#articleTitle').val()},
				async:false, 
				success : function(result) {
					alert(result);
				}
			});
			parent.document.getElementById("content-iframe").src='page/html/showArticle';//跳转回文章列表
		}
		
		//滚动条特效
		var header_demo = document.getElementById("bottom");
		var header_demo1 = document.getElementById("header_demo1");
		var header_demo2 = document.getElementById("header_demo2");
		var speed=20;    //数值越大滚动速度越慢
		header_demo2.innerHTML = header_demo1.innerHTML;
		function Marquee(){
   			if(header_demo2.offsetWidth-header_demo.scrollLeft<=0||(header_demo2.offsetWidth>1365&&header_demo.scrollLeft>1194)){
   				header_demo.scrollLeft-=header_demo1.offsetWidth;
   			}else{
        		header_demo.scrollLeft++;
    		}
		}
		var MyMar = setInterval(Marquee,speed);
		header_demo.onmouseover = function(){clearInterval(MyMar);}
		header_demo.onmouseout = function(){MyMar = setInterval(Marquee,speed);}
	</script>
</body>

</html>