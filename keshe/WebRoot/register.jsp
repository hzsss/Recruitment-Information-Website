<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<%@ include file = "head.txt" %>
</head>
<body><center>
	<form action="helpRegister" name="form" method="post">
		<table>
			用户名必须由字母和数字组成
			<tr><td>用户名：</td><td><input type="text" name="logname">*</td></tr>
			<tr><td>密码：</td><td><input type="password" name="password">*</td></tr>
			<tr><td>确认密码：</td><td><input type="password" name="confirmPassword">*</td></tr>
		</table><br>
		<input type="submit" value="注册" name="submit">
	</form></center>
</body>
</html>