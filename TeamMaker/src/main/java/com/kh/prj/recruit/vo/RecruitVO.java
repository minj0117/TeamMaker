package com.kh.prj.recruit.vo;

import java.sql.Date;

public class RecruitVO {
	private int rno;			//RNO	NUMBER	No		1	글번호
	private String id;			//ID	VARCHAR2(40 BYTE)	No		2	작성자
	private String rtitle;		//RTITLE	VARCHAR2(100 BYTE)	No		3	제목
	private String rpw;			//RPW	VARCHAR2(40 BYTE)	No		4	글비밀번호
	private String ronoff;		//RONOFF	VARCHAR2(5 BYTE)	No		5	온오프라인
	private String rcategory;	//RCATEGORY	VARCHAR2(40 BYTE)	No		6	글 카테고리
	private String rcomment;	//RCOMMENT	VARCHAR2(3000 BYTE)	Yes		7	글 내용
	private int rcnt;			//RCNT	NUMBER	No	0 	8	조회수
	private Date rcdate;		//RCDATE	DATE	Yes	"systimestamp "	9	등록날짜
	private String rregion;		//RREGION	VARCHAR2(40 BYTE)	Yes		10	지역
	private int rappcnt;		//RAPPCNT	NUMBER	No	0 	11	지원자수
	private int rgroup;			//RGROUP	NUMBER(4,0)	Yes		12	"N번글에 관련된 모든 게시글"
	private int rstep;			//RSTEP	NUMBER(4,0)	Yes		13	원 게시글에서 얼마나 떨어진 글인지
	private int rindent;		//RINDENT	NUMBER(4,0)	Yes		14	몇번째 들여쓰기한 게시글
	private String teamname;
	private int tno;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRpw() {
		return rpw;
	}
	public void setRpw(String rpw) {
		this.rpw = rpw;
	}
	public String getRonoff() {
		return ronoff;
	}
	public void setRonoff(String ronoff) {
		this.ronoff = ronoff;
	}
	public String getRcategory() {
		return rcategory;
	}
	public void setRcategory(String rcategory) {
		this.rcategory = rcategory;
	}
	public String getRcomment() {
		return rcomment;
	}
	public void setRcomment(String rcomment) {
		this.rcomment = rcomment;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public Date getRcdate() {
		return rcdate;
	}
	public void setRcdate(Date rcdate) {
		this.rcdate = rcdate;
	}
	public String getRregion() {
		return rregion;
	}
	public void setRregion(String rregion) {
		this.rregion = rregion;
	}
	public int getRappcnt() {
		return rappcnt;
	}
	public void setRappcnt(int rappcnt) {
		this.rappcnt = rappcnt;
	}
	public int getRgroup() {
		return rgroup;
	}
	public void setRgroup(int rgroup) {
		this.rgroup = rgroup;
	}
	public int getRstep() {
		return rstep;
	}
	public void setRstep(int rstep) {
		this.rstep = rstep;
	}
	public int getRindent() {
		return rindent;
	}
	public void setRindent(int rindent) {
		this.rindent = rindent;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	
	
}
