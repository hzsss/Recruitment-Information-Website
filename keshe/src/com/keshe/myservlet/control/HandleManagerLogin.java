package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class HandleManagerLogin extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Connection con;
		PreparedStatement sql;
		Manager manager = null;
		String backNews = "";
		HttpSession session = request.getSession(true);
		
		try {
			manager = (Manager)session.getAttribute("manager");
			if (manager==null) {
				manager = new Manager();
				session.setAttribute("manager", manager);
			}
		} catch (Exception ee) {
			manager = new Manager();
			session.setAttribute("manager", manager);
		}
		
		String managerName = request.getParameter("managerName").trim();
		String managerPassword = request.getParameter("managerPassword").trim();
		boolean ok = manager.getSuccess();
		
		if (ok==true&&managerName.equals(manager.getLogname())) {
			backNews = managerName+"已经登录了";
			manager.setBackNews(backNews);
		} else {
			String uri = "jdbc:mysql://localhost/factory";
			boolean boo = (managerName.length()>0)&&(managerPassword.length()>0);
			
			try {
				con = DriverManager.getConnection(uri, "root", "7162");
				String condition = "select * from manager where managername = ? and managerpassword = ?";
				sql = con.prepareStatement(condition);
				
				if (boo) {
					sql.setString(1, managerName);
					sql.setString(2, managerPassword);
					ResultSet rs = sql.executeQuery();
					boolean m = rs.next();
					
					if (m==true) {
						backNews = "登录成功";
						manager.setBackNews(backNews);
						manager.setSuccess(true);
						manager.setLogname(managerName);
				

						
					} else {
						backNews = "您输入的用户名不存在或者密码不正确";
						manager.setBackNews(backNews);
						manager.setSuccess(false);
						manager.setLogname(managerName);
						manager.setPassword(managerPassword);
						
					
					}
				} else {
					backNews = "您输入的用户名不存在或者密码不正确";
					manager.setBackNews(backNews);
					manager.setSuccess(false);
					manager.setLogname(managerName);
					manager.setPassword(managerPassword);
					
				}
				con.close();
			} catch (SQLException exp) {
				backNews = ""+exp;
				manager.setBackNews(backNews);
				manager.setSuccess(false);
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("showManagerLogin.jsp");
		dispatcher.forward(request, response);
//		response.setContentType("text/html;charset=gb2312"); // 乱码解决
//		response.getWriter().print("<script language='javascript'>alert('ID不存在!');</script>");
//		response.setHeader("refresh", "0.1;managerLogin.jsp"); // 延迟0.1秒
//		return;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
