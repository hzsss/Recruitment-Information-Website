<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "manager" class="com.keshe.mybean.data.Manager" scope="request"/> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link rel="stylesheet" type="text/css" href="index.css" />
	<style type="text/css">
		.fenlan{
			display: flex;
			  justify-content: center;
		}
		.fenlan img{
				width: 550px;
			height: 550px;
		}
		.button{
				display: flex;
			  justify-content: center;
		}
		#bt{
			 	 font-family:微软雅黑; 
				width: 150px ;          
				height:30px ;           
				font-size:14px;          
				margin-left: 10px;           
				background-color:#b8d6fc;          
				box-shadow:10px 10px 10px gray;  
				border-radius:10px 10px 10px 10px;
				cursor:pointer;  
						}
		.HM{
			    position: absolute;   
		top: 50%;   
		left:50%;   
		margin-left:-80px;
		margin-top:-50px;
		}
		.denglu{
			font-size:20px;
		}
	</style>
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
	<div class="fenlan"><img src="img/fenlan.jpg"></div>
	<div class="HM">
	  		<font size="4" color="blue"><br>
  			<jsp:getProperty name="manager" property="backNews"/>
  		</font>
		<div class="denglu">
  		<% 
  			if (manager.getSuccess()==true) {
  		%>
  			<br>登录用户名称：<jsp:getProperty name="manager" property="managerName"/>
  		<%	}
  			else {
  		 %>
  		 	<br>登录用户名称：<jsp:getProperty name="manager" property="managerName"/>
  		 	<br>登录用户密码：<jsp:getProperty name="manager" property="managerPassword"/>
  		 <%
  		 	}
  		  %>
		</div>  
	</div>
	<div class="button">
	<form action="helpManager" name="form" method="post">
		<input type="submit" value="管理评论信息" id="bt" />
	</form>
	</div>
</body>

</html> 