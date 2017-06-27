package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleIndex extends HttpServlet {
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
		Index index = null;
		
		try {
			index = (Index)session.getAttribute("index");
			if (index == null) {
				index = new Index();
			}
		} catch(Exception exp) {
			index = new Index();
		}
			
		int pageSize = index.getPageSize();
		int showPage = Integer.parseInt(request.getParameter("showPage"));
		
		if (showPage>index.getPageAllCount()) {
			showPage = 1;
			index.setShowPage(showPage);
		}else if (showPage<=0) {
			showPage = index.getPageAllCount();
			index.setShowPage(showPage);
		} else {
			index.setShowPage(showPage);
		}
		
		System.out.println("按钮显示的页数"+showPage);
		System.out.println("真实的页数"+index.getShowPage());
		
		String uri = "jdbc:mysql://localhost/factory?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		try {
			con = DriverManager.getConnection(uri, "root", "7162");
			Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = sql.executeQuery("SELECT * FROM news");
			rowSet = new CachedRowSetImpl();
			rowSet.populate(rs);
			con.close();
			index.setRowSet(rowSet);
			rowSet.last();
			int m = rowSet.getRow();
			int n = pageSize;
			int pageAllCount = ((m%n)==0)?(m/n):(m/n+1);
			index.setPageAllCount(pageAllCount);
			presentPageResult = show(showPage, pageSize, rowSet);
			//System.out.println(presentPageResult);
			request.setAttribute("index", index);
			session.setAttribute("index", index);
			index.setPresentPageResult(presentPageResult);
		} catch(SQLException exp) {}
		RequestDispatcher dispatcher = request.getRequestDispatcher("showIndex.jsp");
		dispatcher.forward(request, response);
	}
	
	public StringBuffer show(int page, int pageSize, CachedRowSetImpl rowSet) {
		StringBuffer str = new StringBuffer();
		try {
			rowSet.absolute((page-1)*pageSize+1);
			for (int i=1; i<=pageSize; i++) {
				str.append("<tr>");
				for (int j=1; j<=8; j++) {
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
