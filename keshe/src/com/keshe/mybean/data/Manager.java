package com.keshe.mybean.data;

public class Manager {
	String managerName, managerPassword, backNews="";
	boolean success = false;

	public void setLogname(String name) {
		managerName = name;
	}
	public String getLogname() {
		return managerName;
	}

	public void setPassword(String pw) {
		managerPassword = pw;
	}
	public String getPassword() {
		return managerPassword;
	}

	public void setBackNews(String s) {
		backNews = s;
	}
	public String getBackNews() {
		return backNews;
	}

	public void setSuccess(boolean b) {
		success = b;
	}
	public boolean getSuccess() {
		return success;
	}
}
