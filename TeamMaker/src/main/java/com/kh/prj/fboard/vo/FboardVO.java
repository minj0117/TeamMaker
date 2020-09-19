package com.kh.prj.fboard.vo;

import java.sql.Date;

public class FboardVO {
	private int fno;			//FNO	NUMBER	No		1	번호
	private String writer;		//WRITER	VARCHAR2(40 BYTE)	No		2	작성자
	private String title;		//TITLE	VARCHAR2(100 BYTE)	No		3	제목
	private String f_comment;	//F_COMMENT	VARCHAR2(3000 BYTE)	No		4	내용
	private Date cdate;			//CDATE	TIMESTAMP(6)	Yes	"systimestamp "	5	작성일
	private int cnt;			//CNT	NUMBER	Yes	"0 "	6	추천수
	private String pw;			//PW	VARCHAR2(40 BYTE)	No		7	비밀번호
	private int parent;			//PARENT	NUMBER	Yes	"0 "	11	부모글
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getF_comment() {
		return f_comment;
	}
	public void setF_comment(String f_comment) {
		this.f_comment = f_comment;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	
	
}
