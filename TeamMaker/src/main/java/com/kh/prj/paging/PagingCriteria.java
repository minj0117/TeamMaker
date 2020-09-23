package com.kh.prj.paging;

public class PagingCriteria {
	private int pageNum=1;	//페이지 번호
	private int amount=8;	//페이지당 데이터 갯수
	private int tno;
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	@Override
	public String toString() {
		return "PagingCriteria [pageNum=" + pageNum + ", amount=" + amount + ", tno =" + tno +" ]";
	}
}
