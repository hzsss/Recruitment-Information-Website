<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.keshe.mybean.data.*" %>
<jsp:useBean id = "publish" class="com.keshe.mybean.data.Publish" scope="request"/> 
<html>
<head>
	<%@ include file = "head.txt" %>
</head>
<body>
	<center>
		<font size="4" color="blue">
			<br><jsp:getProperty name="publish" property="backNews"/>
		</font>
		<table>
			<tr>
				<tb>信息类别</tb>
				<tb><jsp:getProperty name="publish" property="newstype"/></tb>
			</tr>
			<tr>
				<tb>信息标题</tb>
				<tb><jsp:getProperty name="publish" property="title"/></tb>
			</tr>
		</table><br>
		<table>
			<tr>
				<td>要发布的招聘信息</td>
			</tr>
			<tr>
				<td><TextArea name="message" Rows="6" Cols="100">
					<jsp:getProperty name="publish" property="message"/>
				</TextArea></td>
			</tr>
		</table><br><br>
		<table>
			<tr>
				<td>联系人</td>
			</tr>
			<tr>
				<td><jsp:getProperty name="publish" property="contact"/></td>
			</tr>
				<tr>
				<td>联系电话</td>
			</tr>
			<tr>
				<td><jsp:getProperty name="publish" property="number"/></td>
			</tr>
			<tr>
				<td>发布时间：</td>
			</tr>
			<tr>
				<td><td><jsp:getProperty name="publish" property="uptime"/></td>
			</tr>
		</table>
	</center>
</body>
</html>