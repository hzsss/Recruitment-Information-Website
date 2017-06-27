package com.keshe.mybean.data;

public class Register {
	String logname="", password="";
	String backNews;

	public void setLogname(String name) {
		logname = name;
	}
	public String getLogname() {
		return logname;
	}

	public void setPassword(String pw) {
		password = pw;
	}
	public String getPassword() {
		return password;
	}

	public void setBackNews(String s) {
		backNews = s;
	}
	public String getBackNews() {
		return backNews;
	}
}
