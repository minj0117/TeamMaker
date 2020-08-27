package com.kh.prj.team.vo;

public class TeammemberVO {
	private int no;					//NO	NUMBER	No		1	고유번호
	private int tno;				//TNO	NUMBER	No		2	팀번호
	private String title;			//TITLE	VARCHAR2(100 BYTE)	No		3	팀이름
	private String owner;			//OWNER	VARCHAR2(20 BYTE)	No		4	팀장아이디
	private String userid;			//USERID	VARCHAR2(20 BYTE)	No		5	팀원아이디
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
}
