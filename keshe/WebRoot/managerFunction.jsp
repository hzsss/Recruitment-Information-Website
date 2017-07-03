<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.keshe.mybean.data.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id = "index" class="com.keshe.mybean.data.Index" scope="request"/> 
<html>
  <head>
        <%@ include file="head.txt" %>
  </head>
  <body><center>
  <table>
	<th>用户名</th><th>评论详情</th>
	<jsp:getProperty name="index" property="presentPageResult"/>
  </table>
</center>
  </body>
</html>