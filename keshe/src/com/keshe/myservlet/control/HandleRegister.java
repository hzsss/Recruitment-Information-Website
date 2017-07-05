package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class HandleRegister extends HttpServlet {
	
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
		Register reg = new Register();
		request.setAttribute("register", reg);
		String logname = request.getParameter("logname").trim();
		String password = request.getParameter("password").trim();
		String confirmPassword = request.getParameter("confirmPassword").trim();
		String backNews = "";
		String uri = "jdbc:mysql://localhost/factory?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		if (logname==null) {
			logname="";
		}
		if (password==null) {
			password="";
		}
		if (confirmPassword==null) {
			confirmPassword="";
		}

		boolean isLD = true;
		for (int i=0; i<logname.length(); i++) {
			char c = logname.charAt(i);
			if (!((c<='z'&&c>='a') || (c<='Z'&&c>='A') ||(c<='9'&&c>='0'))) {
				isLD = false;
			}
		}
		
		if (!password.equals(confirmPassword)) {
			backNews = "两次密码输入不相同";
			reg.setBackNews(backNews);
			
			request.setAttribute("message", "两次密码输入不相同！");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else {
			
			boolean boo = logname.length()>0 && password.length()>0 && confirmPassword.length()>0 && isLD;
			
			try {
				con = DriverManager.getConnection(uri, "root", "7162");
				String insertCondition = "INSERT INTO users VALUES(?,?)";
				sql = con.prepareStatement(insertCondition);
				if (boo) {
					sql.setString(1, logname);
					sql.setString(2, password);

					int m = sql.executeUpdate();
					if (m!=0) {
						backNews = "注册成功";
						reg.setBackNews(backNews);
						reg.setLogname(logname);
						reg.setPassword(password);	
						
						request.setAttribute("message", "注册成功！");
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
				} else {
					backNews = "请输入正确的账号和密码格式";
					reg.setBackNews(backNews);
					
					request.setAttribute("message", "请输入正确的账号和密码格式！");
					request.getRequestDispatcher("register.jsp").forward(request, response);
				}
				con.close();
			} catch (SQLException exp) {
				backNews="该用户名已被占用";
				reg.setBackNews(backNews);
				reg.setLogname(logname);
				
				request.setAttribute("message", "该用户名已被占用！");
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
			
//			response.setContentType("text/html;charset=gb2312"); // 乱码解决
//			response.getWriter().print("<script language='javascript'>alert('backNews');</script>");
//			response.setHeader("refresh", "0.1;index.jsp"); // 延迟0.1秒
//			return;
		}
//		RequestDispatcher dispatcher = request.getRequestDispatcher("showRegister.jsp");
//		dispatcher.forward(request, response);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
