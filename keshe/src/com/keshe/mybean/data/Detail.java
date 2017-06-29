package com.keshe.mybean.data;

import com.sun.rowset.CachedRowSetImpl;

public class Detail {
	int newsid;
	String  newstype, logname, title, message, uptime, contact, number,comment = "";
	String backNews;
	CachedRowSetImpl rowSet = null; // 储存表中全部记录的行集对象
	int pageSize = 3; // 每页显示的记录数
	int pageAllCount = 0; // 分页后的总页数
	int showPage = 1; // 当前显示页
	StringBuffer presentPageResult = null; // 显示当前页内容
	
	public void setNewsid(int a) {
		newsid = a;
	}
	public int getNewsid() {
		return newsid;
	}
	
	public void setNewstype(String b) {
		newstype = b;
	}
	public String getNewstype() {
		return newstype;
	}
	
	public void setLogname(String n) {
		logname = n;
	}
	public String getLogname() {
		return logname;
	}
	
	public void setTitle(String t) {
		title = t;
	}
	public String getTitle() {
		return title;
	}
	
	public void setMessage(String m) {
		message = m;
	}
	public String getMessage() {
		return message;
	}
	
	public void setUptime(String u) {
		uptime = u;
	}
	public String getUptime() {
		return uptime;
	}
	
	public void setContact(String c) {
		contact = c;
	}
	public String getContact() {
		return contact;
	}
	
	public void setNumber(String nu) {
		number = nu;
	}
	public String getNumber() {
		return number;
	}
	public void setComment(String pz) {
		comment = pz;
	}
	public String getComment() {
		return comment;
	}
	public void setBackNews(String s) {
		backNews = s;
	}
	public String getBackNews() {
		return backNews;
	}
	public void setRowSet(CachedRowSetImpl set) {
		rowSet = set;
	}
	public CachedRowSetImpl getRowSet() {
		return rowSet;
	}
	
	public void setPageSize(int size) {
		pageSize  = size;
	}
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageAllCount(int m) {
		pageAllCount = m;
	}
	public int getPageAllCount() {
		return pageAllCount;
	}
	
	public void setShowPage(int n) {
		showPage = n;
	}
	public int getShowPage() {
		return showPage;
	}
	
	public void setPresentPageResult(StringBuffer p) {
		presentPageResult = p;
	}
	public StringBuffer getPresentPageResult() {
		return presentPageResult;
	}
}
