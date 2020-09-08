package com.kh.prj.teamboard.vo;

import java.sql.Date;

public class TeamboardReplyVO {
	private int rno;			//RNO	NUMBER	No		1	답글번호
	private int bno; 			//BNO	NUMBER	No		2	원글번호
	private String rwriter;		//RWRITER	VARCHAR2(40 BYTE)	No		3	작성자
	private String rcontent;	//RCONTENT	VARCHAR2(3000 BYTE)	No		4	댓글내용
	private Date rcdate;		//RCDATE	TIMESTAMP(6)	Yes	systimestamp 	5	작성일
	private String rpw;			//RPW	VARCHAR2(40 BYTE)	No		6	댓글비밀번호
	private int rgroup;			//RGROUP	VARCHAR2(20 BYTE)	Yes		7	그룹
	private int rlevel;			//RLEVEL	VARCHAR2(20 BYTE)	Yes	0 	8	레벨
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public Date getRcdate() {
		return rcdate;
	}
	public void setRcdate(Date rcdate) {
		this.rcdate = rcdate;
	}
	public String getRpw() {
		return rpw;
	}
	public void setRpw(String rpw) {
		this.rpw = rpw;
	}
	public int getRgroup() {
		return rgroup;
	}
	public void setRgroup(int rgroup) {
		this.rgroup = rgroup;
	}
	public int getRlevel() {
		return rlevel;
	}
	public void setRlevel(int rlevel) {
		this.rlevel = rlevel;
	}
	
	
}
