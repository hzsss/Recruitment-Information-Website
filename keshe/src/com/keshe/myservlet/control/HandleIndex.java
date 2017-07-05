package com.keshe.myservlet.control;

import com.keshe.mybean.data.*;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleIndex extends HttpServlet {
	CachedRowSetImpl rowSet = null;
	int newsid;
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
		
		int newstype = Integer.parseInt(request.getParameter("newstype"));
		index.setNewstype(newstype);
		
		System.out.print(newstype);
		
		if (showPage>index.getPageAllCount()) {
			showPage = 1;
			index.setShowPage(showPage);
		}else if (showPage<=0) {
			showPage = index.getPageAllCount();
			index.setShowPage(showPage);
		} else {
			index.setShowPage(showPage);
		}
		
		
		String uri = "jdbc:mysql://localhost/factory?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		try {
			con = DriverManager.getConnection(uri, "root", "7162");
			Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = null;
			
			if (newstype==0) {
				rs = sql.executeQuery("SELECT * FROM news");
			} else{
				rs = sql.executeQuery("SELECT * FROM news where newstype="+newstype);
			}
			
			rowSet = new CachedRowSetImpl();
			rowSet.populate(rs);
			con.close();
			
			int count = 0;
			while(rowSet.next()) {
				count += 1;
			}
			
			index.setRowSet(rowSet);
			rowSet.last();
			int m = rowSet.getRow();			
			int n = pageSize;
			int pageAllCount = ((m%n)==0)?(m/n):(m/n+1);
			index.setPageAllCount(pageAllCount);

			if (count!=0) {
				presentPageResult = show(showPage, pageSize, rowSet);
			}
			
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
				str.append("<tr class='features'>");
//				for (int j=1; j<=8; j++) {
//					str.append("<td class='features'>"+rowSet.getString(j)+"</td>");					
//				}
				str.append("<td class='features'>"+rowSet.getString("logname")+"</td>");
				str.append("<td class='features'>"+rowSet.getString("title")+"</td>");
				str.append("<td class='features'>"+rowSet.getString("message")+"</td>");
				str.append("<td class='features'>"+rowSet.getString("uptime")+"</td>");
				str.append("<td class='features'>"+rowSet.getString("contact")+"</td>");
				str.append("<td class='features'>"+rowSet.getString("number")+"</td>");
				newsid = rowSet.getInt(1);
				
				String detail="<form action='helpDetail' method='post'>"+
						  "<input type='hidden' name='detail' value="+newsid+">"+"<input type='hidden' name='showPage' value=1>"+
						  "<input type='submit' value='查看详情'></form>";
				str.append("<td class='features'>"+detail+"</td>");
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
