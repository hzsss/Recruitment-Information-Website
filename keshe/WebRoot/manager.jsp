<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id = "manager" class="com.keshe.mybean.data.Manager" scope="request"/> 
<html>
<head>
	<%@ include file = "head.txt"%>
</head>
<body>
  	<center>
  		<font size="4" color="blue"><br>
  			<jsp:getProperty name="manager" property="backNews"/>
  		</font>
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
  		  	<form action="helpManager" name="form" method="post">
			<input type="submit" name="submit" value="管理用户评论">
		</form>
  	</center>
</body>
</html> 