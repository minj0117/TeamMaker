package com.kh.prj.member.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String id;					//USER_ID	VARCHAR2(40 BYTE)	No		1	아이디
	private String pw;					//USER_PW	VARCHAR2(40 BYTE)	No		2	패스워드
	private String name;				//USER_NAME	VARCHAR2(40 BYTE)	No		3	이름
	private Date birth;				//USER_BIRTH	DATE	No		4	생일
	private String gender;				//USER_GENDER	VARCHAR2(3 BYTE)	No		5	성별
	private String phone;				//USER_PHONE	VARCHAR2(40 BYTE)	No		6	전화번호
	private String email;				//USER_EMAIL	VARCHAR2(40 BYTE)	No		7	이메일
	private Timestamp cdate;			//USER_CDATE	TIMESTAMP(6)	Yes	"systimestamp"	8	생성일
	private int dancntnumber;				//USER_DAN_CNT_NUMBER	NUMBER	Yes	"0"	9	신고받은 횟수
	private String free;				//USER_FREE	VARCHAR2(3000 BYTE)	Yes		10	자유소개란
	//private List<MultipartFile> files;	//USER_IMG	BLOB	Yes		11	사진란
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}
	public int getDancntnumber() {
		return dancntnumber;
	}
	public void setDancntnumber(int dancntnumber) {
		this.dancntnumber = dancntnumber;
	}
	public String getFree() {
		return free;
	}
	public void setFree(String free) {
		this.free = free;
	}
}
