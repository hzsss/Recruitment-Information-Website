package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import com.sun.rowset.*;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleShowComment extends HttpServlet {
	CachedRowSetImpl rowSet = null;
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
		StringBuffer presentPageResult = new StringBuffer();
		Detail detail = (Detail)session.getAttribute("detail");
		
		System.out.print("测试Detail"+detail.getTitle());
		
		int showPage = Integer.parseInt(session.getAttribute("showPage").toString());
		
		int pageSize = detail.getPageSize();
		if (showPage>detail.getPageAllCount()) {
			showPage = 1;
			detail.setShowPage(showPage);
		}else if (showPage<=0) {
			showPage = detail.getPageAllCount();
			detail.setShowPage(showPage);
		} else {
			detail.setShowPage(showPage);
		}
	
		String uri = "jdbc:mysql://localhost/factory?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		
		try {
			con = DriverManager.getConnection(uri, "root", "7162");
			Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = sql.executeQuery("SELECT * FROM comment");
			rowSet = new CachedRowSetImpl();
			rowSet.populate(rs);
			con.close();
			detail.setRowSet(rowSet);
			rowSet.last();
			
			int m = rowSet.getRow();
			int n = pageSize;
			int pageAllCount = ((m%n)==0)?(m/n):(m/n+1);
			
			System.out.print("评论的总页数为"+pageAllCount);
			
			detail.setPageAllCount(pageAllCount);
			presentPageResult = show(showPage, pageSize, rowSet);
			detail.setPresentPageResult(presentPageResult);
			request.setAttribute("detail", detail);
		} catch(SQLException exp) {}

		RequestDispatcher dispatcher = request.getRequestDispatcher("showDetail.jsp");
		dispatcher.forward(request, response);
	}
	public StringBuffer show(int page, int pageSize, CachedRowSetImpl rowSet) {
		StringBuffer str = new StringBuffer();
		try {
			rowSet.absolute((page-1)*pageSize+1);
			for (int i=1; i<=pageSize; i++) {
				str.append("<tr>");
				for (int j=1; j<=4; j++) {
					str.append("<td>"+rowSet.getString(j)+"</td>");					
				}
				str.append("</tr>");
				rowSet.next();
			}
		} catch(SQLException exp) {}
		return str;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
