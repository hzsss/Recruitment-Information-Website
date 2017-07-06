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
		
		int showPage = Integer.parseInt(session.getAttribute("showPage").toString());
		int newsid = detail.getNewsid();
		
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
			ResultSet rs = sql.executeQuery("SELECT * FROM comment where newsid ="+newsid);
			rowSet = new CachedRowSetImpl();
			rowSet.populate(rs);
			con.close();
			detail.setRowSet(rowSet);
			rowSet.last();
			
			int m = rowSet.getRow();
			int n = pageSize;
			int pageAllCount = ((m%n)==0)?(m/n):(m/n+1);

			
			detail.setPageAllCount(pageAllCount);
			
			if (m!=0) {
				presentPageResult = show(showPage, pageSize, rowSet);
			} else {

			}

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
				str.append("<tr class='features'>");
				
				str.append("<td class='features'>"+rowSet.getString("logname")+"</td>");
				str.append("<td class='features'>"+rowSet.getString("comment")+"</td>");
				
				int commentid = rowSet.getInt("commentid"); // 评论的id
				String comlogname = rowSet.getString("logname"); // 评论的用户名

				String detail="<form action='helpDeleteComment' method='post'>"+"<input type='hidden' name='commentid' value="+commentid+">"
						+"<input type='hidden' name='comlogname' value="+comlogname+">"+
						  "<input type='submit' value='删除评论'></form>";
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
