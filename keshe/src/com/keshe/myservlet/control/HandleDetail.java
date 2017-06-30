package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleDetail extends HttpServlet {
	String newsid;
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
		Detail detail = new Detail();
//		Comment comment = new Comment(); // 评论
		int showPage = Integer.parseInt(request.getParameter("showPage"));
		
		session.setAttribute("showPage", showPage);
		
		String uri = "jdbc:mysql://localhost/factory?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		try {
			newsid = request.getParameter("detail");
			con = DriverManager.getConnection(uri, "root", "7162");
			Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = sql.executeQuery("SELECT * FROM news where newsid ="+newsid);
			rs.next();
			
			String title = rs.getString("title");
			String contact = rs.getString(7);
			String number = rs.getString(8);
			String message = rs.getString(4);
			
			detail.setTitle(title);
			detail.setContact(contact);
			detail.setNumber(number);
			detail.setMessage(message);
			detail.setNewsid(Integer.parseInt(newsid));

			con.close();

			session.setAttribute("detail", detail);
		
		} catch(SQLException exp) {}

		RequestDispatcher dispatcher = request.getRequestDispatcher("helpShowComment");
		dispatcher.forward(request, response);
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
