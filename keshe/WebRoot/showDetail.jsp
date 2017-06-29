<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.keshe.mybean.data.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id = "detail" class="com.keshe.mybean.data.Detail" scope="request"/> 
<html>
  <head>
    <%@ include file="head.txt" %>
  </head>
  
  <body>
    <center>
      信息标题：<jsp:getProperty name="detail" property="title"/><br>
      联系人：<jsp:getProperty name="detail" property="contact"/><br>
      联系电话<jsp:getProperty name="detail" property="number"/><br>
      信息详情：<TextArea name="message" Rows="6" Cols="100">
			  <jsp:getProperty name="detail" property="message"/>
			  </TextArea>
			  
			  <table>
			  	<th>用户名</th><th>评论详情</th>
			  	<jsp:getProperty name="detail" property="presentPageResult"/>
			  </table>
				<table>
			<tr>
				<td>
					<form action="helpDetail" method="post" name="form">
						<input type="hidden" value="<%=detail.getShowPage()-1 %>" name="showPage">
						<input type="submit" value="上一页" name="submit">
					</form>
				</td>
				<td>
					<form action="helpDetail" method="post" name="form">
						<input type="hidden" value="<%=detail.getShowPage()+1 %>" name="showPage">
						<input type="submit" value="下一页" name="submit">
					</form>
				</td>
				<td>
					<form action="helpDetail" method="post" name="form">
						输入页码：<input type="text" name="showPage" size="5">
						<input type="submit" name="g" value="提交">
					</form>
				</td>
			</tr>
		</table>
			  <form action="helpComment" name="form" method="post">
			  	<TextArea name="comment" Rows="6" Cols="80"></TextArea>			  	
				<input type="hidden" name="newsid" value="<%=detail.getNewsid()%>">
			  	<input type="submit" name="g" value="发布">
			  </form>
     </center>    
  </body>
</html>
