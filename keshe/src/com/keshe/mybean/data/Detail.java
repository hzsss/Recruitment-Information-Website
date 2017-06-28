package com.keshe.mybean.data;

public class Detail {
	int newsid;
	String  newstype, logname, title, message, uptime, contact, number,comment = "";
	String backNews;
	
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
}
