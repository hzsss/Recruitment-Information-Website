<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.keshe.mybean.data.Login"%>

<jsp:useBean id="login" class="com.keshe.mybean.data.Login" scope="session"/>

<html>
  <head>
	<%@ include file="head.txt" %>
  </head>
  <body>
  	<center>
  		<font size="4" color="blue"><br>
  			<jsp:getProperty name="login" property="backNews"/>
  		</font>
  		<% 
  			if (login.getSuccess()==true) {
  		%>
  			<br>登录用户名称：<jsp:getProperty name="login" property="logname"/>
  		<%	}
  			else {
  		 %>
  		 	<br>登录用户名称：<jsp:getProperty name="login" property="logname"/>
  		 	<br>登录用户密码：<jsp:getProperty name="login" property="password"/>
  		 <%
  		 	}
  		  %>
  	</center>
  </body>
</html>
