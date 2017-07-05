<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="com.keshe.mybean.data.*" %>
<jsp:useBean id = "index" class="com.keshe.mybean.data.Index" scope="session"/> 
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


</style>
<link rel="stylesheet" type="text/css" href="index.css" />
  </head>
  <body><center>
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
 	<table class="pricing_table"><div class="price">
 		<tr class="tr">
 			<td>用户名</td><td>标题</td><td>招聘信息</td>
 			<td>发布时间</td><td>联系人</td><td>联系电话</td><td>查看详情</td>
 		</tr>
<!-- 			<jsp:getProperty property="presentPageResult" name="index"/> -->
		<%
			Index in = (Index)request.getAttribute("index");
		 %>
		 <%=in.getPresentPageResult() %>
		 </div>
		</table>

		<table>
			<tr>
				<td>
					<form action="helpIndex" method="post" name="form">
						<input type="hidden" name="newstype" value=<%=index.getNewstype() %>>
						<input type="hidden" value="<%=index.getShowPage()-1 %>" name="showPage">
						<input type="submit" value="上一页" name="submit">
					</form>
				</td>
				<td>
					<form action="helpIndex" method="post" name="form">
						<input type="hidden" name="newstype" value=<%=index.getNewstype() %>>
						<input type="hidden" value="<%=index.getShowPage()+1 %>" name="showPage">
						<input type="submit" value="下一页" name="submit">
					</form>
				</td>
				<td>
					<form action="helpIndex" method="post" name="form">
						输入页码：<input type="text" name="showPage" size="5">
						<input type="submit" name="g" value="提交">
					</form>
				</td>
			</tr>
		</table></center>
		<script type="text/javascript" src="js/nav.js"></script>
  </body>
</html>
