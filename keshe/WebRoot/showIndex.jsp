<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="com.keshe.mybean.data.*" %>
<jsp:useBean id = "index" class="com.keshe.mybean.data.Index" scope="session"/> 
<html>
  <head>
  	<%@ include file = "head.txt" %>
  </head>
  <body><center>
 	<table border = 1>
 		<tr>
 			<th>标识</th><th>用户名</th><th>标题</th><th>招聘信息</th>
 			<th>类别</th><th>发布时间</th><th>联系人</th><th>联系电话</th>
 		</tr>
<!-- 			<jsp:getProperty property="presentPageResult" name="index"/> -->
		<%
			Index in = (Index)request.getAttribute("index");
		 %>
		 <%=in.getPresentPageResult() %>
		</table>

		<table>
			<tr>
				<td>
					<form action="helpIndex" method="post" name="form">
						<input type="hidden" value="<%=index.getShowPage()-1 %>" name="showPage">
						<input type="submit" value="上一页" name="submit">
					</form>
				</td>
				<td>
					<form action="helpIndex" method="post" name="form">
						<input type="hidden" value="<%=index.getShowPage()+1 %>" name="showPage">
						<input type="submit" value="下一页" name="submit">
					</form>
				</td>
				<td>
					<form action="helpIndex" method="post" name="form">
						输入页码：<input type="text" name="showPage" size="5">
						<input type="submit" name="g" value="提交">
					</form>
				</td>
			</tr>
		</table></center>
  </body>
</html>
