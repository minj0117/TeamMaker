package com.kh.prj.admin.vo;

public class AdminVO {
	private String id;//ID	VARCHAR2(40 BYTE)	No		1	
	private String pw;//PW	VARCHAR2(40 BYTE)	No		2	
	private String name;//NAME	VARCHAR2(40 BYTE)	No		3	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
