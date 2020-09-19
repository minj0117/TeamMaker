package com.kh.prj.gong.vo;

import java.sql.Date;

public class GongVO {

	private int gno; // GNO NUMBER No 1 번호
	private String writer; // WRITER VARCHAR2(40 BYTE) No 2 작성자
	private String category; // CATEGORY VARCHAR2(20 BYTE) No 3 카테고리
	private Date cdate; // CDATE TIMESTAMP(6) Yes "systimestamp" 4 작성일
	private String title; // TITLE VARCHAR2(100 BYTE) No 5 제목
	private Date applystart; // APPLYSTART DATE No 6 신청 시작날
	private Date applyend; // APPLYEND DATE No 7 신청 마감날
	private Date startday; // STARTDAY DATE No 8 공모전 시작일
	private String host; // HOST VARCHAR2(100 BYTE) No 9 주최자
	private String way; // WAY VARCHAR2(100 BYTE) No 10 등록 방법
	private String homepage; // HOMEPAGE VARCHAR2(100 BYTE) Yes 11 홈페이지
	private String g_comment; // G_COMMENT VARCHAR2(3000 BYTE) No 12 내용
	private int cnt; // CNT NUMBER Yes "0" 13 조회수
	private byte[] pic; // PIC BLOB Yes 14 첨부파일
	private String applymoney; // APPLYMONEY VARCHAR2(20 BYTE) Yes 15 참가비
	private String award; // AWARD VARCHAR2(20 BYTE) Yes 16 총 상금
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getApplystart() {
		return applystart;
	}
	public void setApplystart(Date applystart) {
		this.applystart = applystart;
	}
	public Date getApplyend() {
		return applyend;
	}
	public void setApplyend(Date applyend) {
		this.applyend = applyend;
	}
	public Date getStartday() {
		return startday;
	}
	public void setStartday(Date startday) {
		this.startday = startday;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getWay() {
		return way;
	}
	public void setWay(String way) {
		this.way = way;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getG_comment() {
		return g_comment;
	}
	public void setG_comment(String g_comment) {
		this.g_comment = g_comment;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public byte[] getPic() {
		return pic;
	}
	public void setPic(byte[] pic) {
		this.pic = pic;
	}
	public String getApplymoney() {
		return applymoney;
	}
	public void setApplymoney(String applymoney) {
		this.applymoney = applymoney;
	}
	public String getAward() {
		return award;
	}
	public void setAward(String award) {
		this.award = award;
	}
	
	
}
