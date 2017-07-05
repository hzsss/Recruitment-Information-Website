<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.keshe.mybean.data.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id = "detail" class="com.keshe.mybean.data.Detail" scope="request"/> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
	* {margin: 0; padding: 0; }
		
		body {
			font-family: Ubuntu, arial, verdana;
			background: #fff;
		}
		.pricing_table {
			line-height: 150%; 
			font-size: 12px; 
			margin: 0 auto; 
			width: 75%; 
			max-width: 800px; 
			padding-top: 10px;
			margin-top: 100px;
		}
		
		
		.price_number{
			display: table; 
			background: #444; 
			width: 100%; 
			height: 80px; 


			font-weight: bold; 
			display: block;

			text-align: center; 
			
			color: #fff; 
			float: left; 
			list-style-type: none; 
			transition: all 0.25s; 
			position: relative; 
			box-sizing: border-box;
			
			margin-bottom: 10px; 
			border-bottom: 1px solid transparent; 

			font-size: 20px; 
			text-transform: uppercase; 
			vertical-align: middle; 
			display: table-cell;
		}
		.features {
			background: #DEF0F4; 
			color: #000;
			padding: 8px 15px;
			border-bottom: 1px solid #ccc; 
			font-size: 11px; 
			list-style-type: none;
		}
		.tr {
			text-transform: uppercase; 
			padding: 5px 0; 
			background: #333; 
			margin: -10px 0 1px 0;
			color: #fff;
			padding: 8px 15px;
			border-bottom: 1px solid #ccc; 
			font-size: 11px; 
			list-style-type: none;
		}
		.features:hover {
			box-shadow: 0 0 0px 5px rgba(0, 0, 0, 0.5); 
			transform: scale(1.04) translateY(-2px); 
			z-index: 1; 
			border-bottom: 0 none;
		}
		.features:hover .price {
			background:linear-gradient(#DB7224, #F9B84A); 
			box-shadow: inset 0 0 10px 1px #DB7224;
		}
		.features:hover {
			background: #222;
		}
		.features:hover{
			background: linear-gradient(#F9B84A, #DB7224); 
		}
	

	.div2{
      position: absolute;
      left: 240px;
      height: 30px;
      width: 30px;

      	}
      	img{
      		position: absolute;
      		top: 6px;
      		left: 6px;
      	}
	.div1{/*字的*/
	
		width:20%;
        height:35px;
        background-color: #c7e2fd;
        position: absolute;
        left: 270px;
     
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
       font-size: 10px;
        
	}
	.xiao{
		position: absolute;
		left: 140px;
		top: 10px;
		text-align: center;

	}
	.big{
		
		
	}
	#message{
color:#6a6f77;
height:100px;
padding: 5px 0px 0px 5px;
width: 40%;
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
border-radius:4px;
border:1px solid #c7e2fd;
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
font-size: 20px;
position: absolute;
left: 250px;
top: 650px;

}
.span1{
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 20px;
	position: absolute;
	left: 250px;
	top: 620px;
	}
.button {
background:#64b0fe;
border: none;
padding: 10px 25px 10px 25px;
color: #fff;
border-radius: 4px;
-moz-border-radius: 4px;
-webkit-border-radius: 4px;

position: absolute;
right: 350px;
top: 900px; 
font-weight: bold;
box-shadow: 1px 1px 1px #3D3D3D;
-webkit-box-shadow:1px 1px 1px #3D3D3D;
-moz-box-shadow:1px 1px 1px #3D3D3D;
}

.button:hover {
color: #333;
background-color: #EBEBEB;
}	
.div1:hover{
	color: #333;
	background-color: #a1a1a1;
}	


.span2{
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 20px;
	position: absolute;
	left: 250px;
	top: 320px;
	}
	#message2{
color:#6a6f77;
height:100px;
padding: 5px 0px 0px 5px;
width: 40%;
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
border-radius:4px;
border:1px solid #c7e2fd;
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
font-size: 20px;
position: absolute;
left: 250px;
top: 350px;

}
.border{
  width: 1000px;
  height: 100%;
  position:fixed;
  
  z-index: 2;
  
  left: 400px;
  top: 100px;
  /*ebf5ff*/
 
 
  border-left: 2px solid #64b0fe;
  border-right: 2px solid #64b0fe;
  background-color: #f5f9fe;
 

}
.pinglun{
	position: absolute;
left: 250px;
top: 570px;
}
</style>
<link rel="stylesheet" type="text/css" href="index.css" />
</head>
<body>
<nav class="mynav">
	
  	<ul>
  	<li><img src="img/zp.png" alt="招聘信息"></li>
    <li><a href="index.jsp">主页</a></li>
    <li><a href="register.jsp">用户注册</a></li>
    <li><a href="login.jsp">用户登录</a></li>
    <li><a href="publish.jsp">发布招聘信息</a></li>
    <li><a href="changePassword.jsp">修改密码</a></li>
    <li><a href="helpExit">退出登录</a></li>
    <li><a href="managerLogin.jsp">管理员登陆</a></li>
    <li><a href="helpManager">评论信息管理</a></li>
 	 </ul>
</nav>

<span class="target"></span>
<script type="text/javascript" src="js/nav.js"></script>
<div class="border">
<div class="big">

<br><br><br><br>
<br><br><br>

<div>
<div class="div2"><img src="img/lianxiren.png"></div>
<div class="div1">

	<strong><p>&nbsp;&nbsp;&nbsp;用户</p></strong>
	<div class="xiao"><jsp:getProperty name="detail" property="logname"/></div>
</div>
</div>
<br><br>

<div>
<div class="div2"><img src="img/xinxi.png"></div>
<div class="div1">
	<strong><p>&nbsp;&nbsp;&nbsp;信息标题	</p></strong>
	<div class="xiao"><jsp:getProperty name="detail" property="title"/></div>
</div>
<br><br>
</div>






<div>
<div class="div2"><img src="img/time.png"></div>
<div class="div1">
	<strong><p>&nbsp;&nbsp;&nbsp;上传时间	</p></strong>
	<div class="xiao"><jsp:getProperty name="detail" property="uptime"/></div>
</div>
<br><br>
</div>


<div>
<div class="div2"><img src="img/lianxiren.png"></div>
<div class="div1">
	<strong><p>&nbsp;&nbsp;&nbsp;联系人</p></strong>
	<div class="xiao"><jsp:getProperty name="detail" property="contact"/></div>
</div>
<br><br>
</div>

<div>
<div class="div2"><img src="img/tel.png"></div>
<div class="div1">
	<strong><p>&nbsp;&nbsp;&nbsp;电话</p></strong>
	<div class="xiao"><jsp:getProperty name="detail" property="number"/></div>
</div>
</div>


<br><br><br><br>
</div>
<span class="span2">信息详情</span><br><br>
	<textarea id="message2" name="message2" placeholder=""><jsp:getProperty name="detail" property="message"/></textarea>
<div class="pinglun">
<table class="pricing_table">
		<tr class="tr">
			  	<th>用户名</th><th>评论详情</th>
		</tr>
			  	<jsp:getProperty name="detail" property="presentPageResult"/>
			  </table>
				<table>
			<tr>
				<td>
					<form action="helpDetail" method="post" name="form">
						<input type="hidden" value="<%=detail.getShowPage()-1 %>" name="showPage">
						<input type="submit" value="上一页" name="submit">
					</form>
				</td>
				<td>
					<form action="helpDetail" method="post" name="form">
						<input type="hidden" value="<%=detail.getShowPage()+1 %>" name="showPage">
						<input type="submit" value="下一页" name="submit">
					</form>
				</td>
				<td>
					<form action="helpDetail" method="post" name="form">
						输入页码：<input type="text" name="showPage" size="5">
						<input type="submit" name="g" value="提交">
					</form>
				</td>
			</tr>
		</table>


<span class="span1">评论</span><br><br>
</div>
<form action="helpComment" name="form" method="post">
	<textarea id="message" name="comment" placeholder="请输入要评论的内容"></textarea>
	<input type="hidden" name="newsid" value="<%=detail.getNewsid()%>">
	<input type="submit" class="button" value="评论">
</form>
</div>
</body>
</html>