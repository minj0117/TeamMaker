package com.kh.prj.teamboard.vo;

import java.sql.Date;

public class TeamboardVO {
	private int bno;			//BNO	NUMBER	No		1	글번호
	private int cnt; 			//CNT	NUMBER	Yes	0 	2	조회수
	private String title;		//TITLE	VARCHAR2(1000 BYTE)	No		3	제목
	private String b_comment;	//B_COMMENT	VARCHAR2(3000 BYTE)	No		4	"내용"
	private String writer;		//WRITER	VARCHAR2(40 BYTE)	No		5	작성자
	private int parent;			//PARENT	NUMBER	Yes	0 	6	부모글
	private Date cdate;			//CDATE	TIMESTAMP(6)	Yes	systimestamp 	7	작성일
	private int tno;
	private int level;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getB_comment() {
		return b_comment;
	}
	public void setB_comment(String b_comment) {
		this.b_comment = b_comment;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	
	
}
