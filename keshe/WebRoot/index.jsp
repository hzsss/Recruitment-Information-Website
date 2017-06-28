<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<%@ include file = "head.txt" %>
</head>
<body>
	<center>
		<h1><font size="4" color="red">欢迎浏览招聘信息</font></h1>
		<br><br>
		<form action="helpIndex" name="form" method="post">
			<input type="hidden" name="showPage" value="1">
			<input type="submit" name="submit" value="查看招聘信息">
		</form>
	</center>
</body>
</html> 