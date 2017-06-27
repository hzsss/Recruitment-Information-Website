<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.keshe.mybean.data.*" %>
<jsp:useBean id = "register" class="com.keshe.mybean.data.Register" scope="request"/> 
<html>
<head>
	<%@ include file = "head.txt" %>
</head>
<body>
	<center>
		<font size="4" color="blue">
			<br><jsp:getProperty name="register" property="backNews"/>
		</font>
		<table>
			<tr>
				<td>用户名：</td>
				<td><jsp:getProperty name="register" property="logname" /></td>
			</tr>
		</table>
	</center>
</body>
</html>