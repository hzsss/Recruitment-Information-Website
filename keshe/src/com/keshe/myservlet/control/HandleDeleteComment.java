package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import com.sun.rowset.*;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleDeleteComment extends HttpServlet {
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
		Login loginBean = (Login)session.getAttribute("login");		
		String uri = "jdbc:mysql://localhost/factory?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		
		String comlogname = request.getParameter("comlogname");
		int commentid = Integer.parseInt(request.getParameter("commentid"));

		if (loginBean!=null) {
			String logname = loginBean.getLogname();

			try {
				con = DriverManager.getConnection(uri, "root", "7162");
				Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
				
				if (logname.equals(comlogname)) {
					System.out.print("哎呦，删除成功了哦");
					sql.executeUpdate("DELETE FROM comment where commentid = '"+commentid+"'");
//					rs.next();
				} else {
					System.out.print("这评论不是你发的删不了");
				}
				
			} catch(SQLException exp) {}
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
