package com.kh.prj.member.vo;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String uid;					//USER_ID	VARCHAR2(40 BYTE)	No		1	아이디
	private String upw;					//USER_PW	VARCHAR2(40 BYTE)	No		2	패스워드
	private String uname;				//USER_NAME	VARCHAR2(40 BYTE)	No		3	이름
	private String ubirth;				//USER_BIRTH	DATE	No		4	생일
	private String ugender;				//USER_GENDER	VARCHAR2(3 BYTE)	No		5	성별
	private String uphone;				//USER_PHONE	VARCHAR2(40 BYTE)	No		6	전화번호
	private String uemail;				//USER_EMAIL	VARCHAR2(40 BYTE)	No		7	이메일
	private Timestamp ucdate;			//USER_CDATE	TIMESTAMP(6)	Yes	"systimestamp"	8	생성일
	private int udancnt;				//USER_DAN_CNT_NUMBER	NUMBER	Yes	"0"	9	신고받은 횟수
	private String ufree;				//USER_FREE	VARCHAR2(3000 BYTE)	Yes		10	자유소개란
	private List<MultipartFile> files;	//USER_IMG	BLOB	Yes		11	사진란
}
