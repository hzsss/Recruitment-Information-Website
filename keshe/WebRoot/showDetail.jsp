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
      信息详情：<TextArea name="message" Rows="6" Cols="100"><br>
			  <jsp:getProperty name="detail" property="message"/>
			  </TextArea>
			  
			  <form action="helpComment" name="form" method="post">
			  	<TextArea name="comment" Rows="6" Cols="80"></TextArea>			  	
				<input type="hidden" name="newsid" value="<%=detail.getNewsid()%>">
			  	<input type="submit" name="g" value="发布">
			  </form>
     </center>
     
     
  </body>
</html>
