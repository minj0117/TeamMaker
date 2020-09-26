package com.kh.prj.member.vo;

public class ReportVO {
	private int no;//NO	NUMBER	No		1	
	private String id;//ID	VARCHAR2(40 BYTE)	Yes	NULL 	2	
	private String r_comment;//R_COMMENT	VARCHAR2(3000 BYTE)	Yes		3
	private int bno;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getR_comment() {
		return r_comment;
	}
	public void setR_comment(String r_comment) {
		this.r_comment = r_comment;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}

	
	
	
}
