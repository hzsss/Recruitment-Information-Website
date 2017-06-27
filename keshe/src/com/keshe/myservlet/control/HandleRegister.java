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

		String uri = "jdbc:mysql://localhost/factory";
		if (logname==null) {
			logname="";
		}
		if (password==null) {
			password="";
		}

		boolean isLD = true;
		for (int i=0; i<logname.length(); i++) {
			char c = logname.charAt(i);
			if (!((c<='z'&&c>='a') || (c<='Z'&&c>='A') ||(c<='9'&&c>='0'))) {
				isLD = false;
			}
		}

		boolean boo = logname.length()>0 && password.length()>0 && isLD;
		String backNews = "";

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
				}
			} else {
				backNews = "信息填写不完整或者有非法字符";
				reg.setBackNews(backNews);
			}
			con.close();
		} catch (SQLException exp) {
			backNews="该用户名已被占用";
			reg.setBackNews(backNews);
			reg.setLogname(logname);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("showRegister.jsp");
		dispatcher.forward(request, response);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
