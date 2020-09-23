package com.kh.prj.teamboard.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private int fno;				//FNO	NUMBER	No		1	파일번호
	private String name;			//NAME	VARCHAR2(300 BYTE)	No		2	파일이름
	private int bno;				//BNO	NUMBER	No		3	게시글번호
	private String writer;			//WRITER	VARCHAR2(40 BYTE)	Yes		5	작성자
	private String title;			//TITLE	VARCHAR2(100 BYTE)	Yes		6	제목
	private String f_comment;		//F_COMMENT	VARCHAR2(3000 BYTE)	Yes		7	내용
	private Date cdate;				//CDATE	TIMESTAMP(6)	Yes	systimestamp 	8	작성일
	private int tno;				//TNO	NUMBER	Yes		9	"팀번호"
	private String fileName;
	private MultipartFile uploadFile;
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	@Override
	public String toString() {
		return "FileVO [ fno : " + fno + ", name : " + name + ", bno : " + bno + ", writer : " + writer + ", title : " + title +
				", f_comment : " + f_comment + ", cdate : " + cdate + ", tno : " + tno + ", filename : " + fileName + ", uploadFile : " + uploadFile + " ]";
	}
	
}
