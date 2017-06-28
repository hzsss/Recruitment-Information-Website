package com.keshe.mybean.data;

public class Comment {
	int newsid;
	String logname, comment = "";
	
	public void setNewsid(int id) {
		newsid = id;
	}
	public int getNewsid() {
		return newsid;
	}
	
	public void setLogname(String n) {
		logname = n;
	}
	public String getLogname() {
		return logname;
	}
	
	public void setComment(String c) {
		comment = c;
	}
	public String getComment() {
		return comment;
	}
}
