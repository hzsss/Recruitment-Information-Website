package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleLogin extends HttpServlet {
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
		Login loginBean = null;
		String backNews = "";
		HttpSession session = request.getSession(true);
		
		try {
			loginBean = (Login)session.getAttribute("login");
			if (loginBean==null) {
				loginBean = new Login();
				session.setAttribute("login", loginBean);
			}
		} catch (Exception ee) {
			loginBean = new Login();
			session.setAttribute("login", loginBean);
		}
		
		String logname = request.getParameter("logname").trim();
		String password = request.getParameter("password").trim();
		boolean ok = loginBean.getSuccess();
		
		if (ok==true&&logname.equals(loginBean.getLogname())) {
			backNews = logname+"已经登录了";
			loginBean.setBackNews(backNews);
		} else {
			String uri = "jdbc:mysql://localhost/factory";
			boolean boo = (logname.length()>0)&&(password.length()>0);
			
			try {
				con = DriverManager.getConnection(uri, "root", "7162");
				String condition = "select * from users where logname = ? and password = ?";
				sql = con.prepareStatement(condition);
				
				if (boo) {
					sql.setString(1, logname);
					sql.setString(2, password);
					ResultSet rs = sql.executeQuery();
					boolean m = rs.next();
					
					if (m==true) {
						backNews = "登录成功";
						loginBean.setBackNews(backNews);
						loginBean.setSuccess(true);
						loginBean.setLogname(logname);
					} else {
						backNews = "您输入的用户名不存在或者密码不正确";
						loginBean.setBackNews(backNews);
						loginBean.setSuccess(false);
						loginBean.setLogname(logname);
						loginBean.setPassword(password);
					}
				} else {
					backNews = "您输入的用户名不存在或者密码不正确";
					loginBean.setBackNews(backNews);
					loginBean.setSuccess(false);
					loginBean.setLogname(logname);
					loginBean.setPassword(password);
				}
				con.close();
			} catch (SQLException exp) {
				backNews = ""+exp;
				loginBean.setBackNews(backNews);
				loginBean.setSuccess(false);
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("showLogin.jsp");
		dispatcher.forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
