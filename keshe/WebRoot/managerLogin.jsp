<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<%@ include file="head.txt"%>
</head>
<body>
<font size="2"> 
<center>
	<br><br>
	<form action="helpManagerLogin" method="post">
		<table border="2">
			<tr><th>管理员登录</th></tr>
			
				<tr><td>管理员名称：<input type="text" name="managerName"></td></tr>
				<tr><td>管理员密码：<input type=password name="managerPassword"></td></tr>
		</table>
		<br><input type="submit" name="g" value="提交">
	</form>
</center>
</body>
</html>