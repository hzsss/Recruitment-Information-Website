package com.keshe.mybean.data;
import com.sun.rowset.*;

public class Index {
	CachedRowSetImpl rowSet = null; // 储存表中全部记录的行集对象
	int pageSize = 3; // 每页显示的记录数
	int pageAllCount = 0; // 分页后的总页数
	int showPage = 1; // 当前显示页
	StringBuffer presentPageResult = null; // 显示当前页的内容
	
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
