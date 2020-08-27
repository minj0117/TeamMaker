package com.kh.prj.apply.vo;

public class ApplyVO {
	private int ano;			//ANO	NUMBER	No		1	번호
	private int tno;			//TNO	NUMBER	No		2	팀번호
	private String applyid;		//APPLYID	VARCHAR2(40 BYTE)	Yes		3	지원자 아이디
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getApplyid() {
		return applyid;
	}
	public void setApplyid(String applyid) {
		this.applyid = applyid;
	}
	
	
}
