package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
			
	        Pattern pattern1 = Pattern.compile("[a-z]*");  
	        Pattern pattern2 = Pattern.compile("[A-Z]*");  
	        Pattern pattern3 = Pattern.compile("[0-9]*");  
	        Pattern pattern4 = Pattern.compile("\\p{Punct}+");
	        
	        Matcher matcher1 = pattern1.matcher(password);  
	        Matcher matcher2 = pattern2.matcher(password);  
	        Matcher matcher3 = pattern3.matcher(password);  
	        Matcher matcher4 = pattern4.matcher(password);
	        
	        if (matcher1.find()&&matcher2.find()&&matcher3.find()&&matcher4.find()) {
			
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
						request.getRequestDispatcher("login.jsp").forward(request, response);
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
	        } else {
	        	request.setAttribute("message", "密码格式不正确！");
				request.getRequestDispatcher("register.jsp").forward(request, response);
	        }
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
