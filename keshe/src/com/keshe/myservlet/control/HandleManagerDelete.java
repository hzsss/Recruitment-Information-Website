package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import com.sun.rowset.*;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleManagerDelete extends HttpServlet {
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
		String uri = "jdbc:mysql://localhost/factory?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		int commentid = Integer.parseInt(request.getParameter("commentid"));
		
		try {
			con = DriverManager.getConnection(uri, "root", "7162");
			Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			sql.executeUpdate("DELETE FROM comment where commentid = '"+commentid+"'");
		
		} catch(SQLException exp) {}
		RequestDispatcher dispatcher = request.getRequestDispatcher("helpManager");
		dispatcher.forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
