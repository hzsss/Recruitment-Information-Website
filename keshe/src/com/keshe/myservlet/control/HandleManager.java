package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleManager extends HttpServlet {
	CachedRowSetImpl rowSet = null;
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		Connection con = null;
		StringBuffer presentPageResult = new StringBuffer();
		Index index = new Index();
		Manager manager = (Manager)session.getAttribute("manager");
		
		if (manager!=null) {
			String uri = "jdbc:mysql://localhost/factory?useUnicode=true&characterEncoding=utf-8&useSSL=false";
			try {
				con = DriverManager.getConnection(uri, "root", "7162");
				Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
				ResultSet rs = sql.executeQuery("SELECT * FROM comment");

				StringBuffer str = new StringBuffer();
				try {
					while (rs.next()) {
						str.append("<tr class='features'>");
						str.append("<td class='features'>"+rs.getString("logname")+"</td>");
						str.append("<td class='features'>"+rs.getString("comment")+"</td>");
						
						int commentid = rs.getInt("commentid"); // 评论的id

						String detail="<form action='helpManagerDelete' method='post'>"+"<input type='hidden' name='commentid' value="+commentid+">"+
								  "<input type='submit' value='删除评论'></form>";
						str.append("<td class='features'>"+detail+"</td>");
						str.append("</tr>");					
					}
					
				} catch(SQLException exp) {}
				
				presentPageResult = str;
				request.setAttribute("index", index);
				index.setPresentPageResult(presentPageResult);
			} catch(SQLException exp) {}
			RequestDispatcher dispatcher = request.getRequestDispatcher("managerFunction.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("message", "您尚未登录！");
			request.getRequestDispatcher("managerLogin.jsp").forward(request, response);
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
