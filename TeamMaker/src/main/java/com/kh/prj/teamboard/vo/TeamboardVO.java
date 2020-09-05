package com.kh.prj.teamboard.vo;

import java.sql.Date;

public class TeamboardVO {
	private int bno;			//BNO	NUMBER	No		1	글번호
	private String btitle;		//BTITLE	VARCHAR2(250 BYTE)	No		2	글제목
	private String bcontent;	//BCONTENT	VARCHAR2(3000 BYTE)	Yes		3	글내용
	private String bwriter;		//BWRITER	VARCHAR2(40 BYTE)	No		4	작성자
	private Date bcdate;		//BCDATE	DATE	Yes	systimestamp 	5	글작성일
	private int cnt;			//CNT	NUMBER	Yes		6	조회수
	private int groupno;		//GROUPNO	NUMBER	No		7	"그룹 번호"
	private int grouprd;		//GROUDRD	NUMBER	No		8	그룹 내 순서
	private int indent;			//INDENT	NUMBER	No		9	들여쓰기
	private int tno;			//TNO	NUMBER	Yes		10	팀번호
	private String bpw;			//BPW	VARCHAR2(20 BYTE)	No		11	글비밀번호
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public Date getBcdate() {
		return bcdate;
	}
	public void setBcdate(Date bcdate) {
		this.bcdate = bcdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public int getGrouprd() {
		return grouprd;
	}
	public void setGrouprd(int grouprd) {
		this.grouprd = grouprd;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getBpw() {
		return bpw;
	}
	public void setBpw(String bpw) {
		this.bpw = bpw;
	}
	
	
}
