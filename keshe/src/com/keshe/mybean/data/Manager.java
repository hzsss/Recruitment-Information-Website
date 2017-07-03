package com.keshe.mybean.data;

public class Manager {
	String managerName, managerPassword, backNews="";
	boolean success = false;

	public void setManagerName(String name) {
		managerName = name;
	}
	public String getManagerName() {
		return managerName;
	}

	public void setManagerPassword(String pw) {
		managerPassword = pw;
	}
	public String getManagerPassword() {
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
