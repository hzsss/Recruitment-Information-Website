<%@ page contentType="text/html; charset=UTF-8" %>
<head><%@ include file="head.txt" %>  </head>

<html>
<body>
<font size="2">
<center>
	<br>请输入您的当前密码和新密码:
	<form action="helpChangePassword" method="post">
		<br>当前密码：<input type="password" name="oldPassword">
		<br>新密码：<input type="password" name="newPassword">
		<br>确认新密码：<input type="password" name="confirmPassword">
		<br><input type="submit" name="g" value="提交">
	</form>
</center>	
</body>
</html>