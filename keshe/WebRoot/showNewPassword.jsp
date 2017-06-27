<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import= "com.keshe.mybean.data.Password" %>
<jsp:useBean id="password" class="com.keshe.mybean.data.Password" scope="request" />
<head><%@ include file="head.txt" %> </head>

<html>
<body>
<center>
	<br><jsp:getProperty name = "password" property ="backNews" />
	<br>你的新密码：<jsp:getProperty name ="password" property="newPassword"/>
	<br>你的旧密码：<jsp:getProperty name ="password" property="oldPassword"/>
</center>
</body>
</html>