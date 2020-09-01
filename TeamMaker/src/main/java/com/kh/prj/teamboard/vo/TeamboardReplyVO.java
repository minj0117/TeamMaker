package com.kh.prj.teamboard.vo;

import java.sql.Date;

public class TeamboardReplyVO {
	private int rno;			//RNO	NUMBER	No		1	답글번호
	private int bno; 			//BNO	NUMBER	No		2	원글번호
	private String rwriter;		//RWRITER	VARCHAR2(40 BYTE)	No		3	작성자
	private String rcontent;	//RCONTENT	VARCHAR2(3000 BYTE)	No		4	댓글내용
	private Date rcdate;		//RCDATE	TIMESTAMP(6)	Yes	systimestamp 	5	작성일
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
	
	
}
