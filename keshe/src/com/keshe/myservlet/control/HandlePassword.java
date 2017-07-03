package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandlePassword extends HttpServlet {
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
		Login login = (Login)session.getAttribute("login");
		
		boolean ok = true;
		if (login==null) {
			ok = false;
			response.sendRedirect("login.jsp");
		}
		if (ok==true) {
			continueWork(request, response);
		}
	}
	
	public void continueWork(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Login login = (Login)session.getAttribute("login");
		
		Connection con = null;
		String logname = login.getLogname();
		Password passwordBean = new Password();
		request.setAttribute("password", passwordBean);
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");

		String uri = "jdbc:mysql://localhost/factory?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		try {
			con = DriverManager.getConnection(uri, "root", "7162");
			Statement sql = con.createStatement();
			ResultSet rs = sql.executeQuery("SELECT * FROM users where logname='"+logname+"' And password='"+oldPassword+"'");

			if (rs.next()) {
				String updateString = "UPDATE users SET password='"+newPassword+"' where logname='"+logname+"'";
				int m = sql.executeUpdate(updateString);
				
				if (!newPassword.equals(confirmPassword)) {
					passwordBean.setBackNews("确认密码不相同");
				} else {
					if (m==1) {
						passwordBean.setBackNews("密码修改成功");
						passwordBean.setOldPassword(oldPassword);
						passwordBean.setNewPassword(newPassword);
					} else {
						passwordBean.setBackNews("密码修改失败");
					}
				}
			}
		} catch (SQLException exp) {
			passwordBean.setBackNews("密码修改失败"+exp);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("showNewPassword.jsp");
		dispatcher.forward(request, response);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}





}
