package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleComment extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Connection con = null;
		PreparedStatement sql;
		HttpSession session = request.getSession(true);
		Login loginBean = (Login)session.getAttribute("login");
		
		if (loginBean!=null) {
			Comment comment = new Comment();
			
			String logname = loginBean.getLogname().trim();
			String content = request.getParameter("comment").trim();
			int newsid = Integer.parseInt(request.getParameter("newsid"));
			System.out.print("传入的id为"+newsid);
			String uri = "jdbc:mysql://localhost/factory?useUnicode=true&characterEncoding=utf-8&useSSL=false";
			
			try {
				con = DriverManager.getConnection(uri, "root", "7162");
				String insertCondition = "INSERT INTO comment(newsid,logname,comment) VALUES(?,?,?)";
				sql = con.prepareStatement(insertCondition);
				sql.setInt(1, newsid);
				sql.setString(2, logname);
				sql.setString(3, content);
				int d = sql.executeUpdate();
				if (d!=0) {
					comment.setNewsid(newsid);
					comment.setLogname(logname);
					comment.setComment(content);
				} else {
				System.out.println("dddd");
				}
				con.close();
				
			} catch(SQLException exp) {
				System.out.print("错误");
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("helpShowComment");
			dispatcher.forward(request, response);			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}



}
