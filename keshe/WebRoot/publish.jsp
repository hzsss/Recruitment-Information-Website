<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<%@ include file = "head.txt" %>
</head>
<body>
<center><form action="helpPublish" name="form" method="post">
		<table>
			<tr>
				<tb>信息类别</tb>
				<tb>
				<select name="newstype"> 
				<option value=1>餐饮</option> 
      			<option value=2>家政</option> 
      			<option value=3>美容美发</option>
      			<option value=4>旅游</option>
				</select>
			</tr><br>
			<tr>
				<tb>信息标题</tb>
				<tb><input type="text" name="title"></tb>
			</tr><br>
			<tr>
				<td>请输入要发布的招聘信息</td>
			</tr>
			<tr>
				<td><TextArea name="message" Rows="6" Cols="80"></TextArea></td>
			</tr>
			
			<tr>
				您的姓名<tb><input type="text" name="contact"></tb>
			</tr><br>
			<tr>
				<tb>联系方式</tb><tb><input type="text" name="number"></tb>
			</tr><br>
		</table><br>
		<input type="submit" name="g" value="发布">
	</center></form>
</body>
</html>