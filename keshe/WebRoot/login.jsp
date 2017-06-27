<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<%@ include file="head.txt"%>
</head>
<body>
<font size="2"> 
<center>
	<br><br>
	<form action="helpLogin" method="post">
		<table border="2">
			<tr><th>请您登录</th></tr>
			
				<tr><td>登录名称：<input type="text" name="logname"></td></tr>
				<tr><td>输入密码：<input type=password name="password"></td></tr>
		</table>
		<br><input type="submit" name="g" value="提交">
	</form>
</center>
</body>
</html>