package com.kh.prj.team.vo;

public class TeamVO {
	private int tno;			//ANO	NUMBER	No		1	고유번호
	private String owner;		//OWNER	VARCHAR2(40 BYTE)	No		2	생성자 아이디
	private String title;		//TITLE	VARCHAR2(100 BYTE)	No		3	팀이름
	private String acomment;	//ACOMMENT	VARCHAR2(3000 BYTE)	Yes		4	팀설명
	private String applicant;   //지원자
	
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAcomment() {
		return acomment;
	}
	public void setAcomment(String acomment) {
		this.acomment = acomment;
	}
	public String getApplicant() {
		return applicant;
	}
	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}
}
