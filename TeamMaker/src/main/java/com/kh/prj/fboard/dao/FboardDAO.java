package com.kh.prj.fboard.dao;

import java.util.List;

import com.kh.prj.fboard.vo.FboardVO;
import com.kh.prj.paging.PagingCriteria;

public interface FboardDAO {
	public int write(FboardVO vo);
	
	public int totalCnt();
	public List<FboardVO> fboardList(PagingCriteria paging);
	public FboardVO view(int fno);
	public int pwCheck(FboardVO vo);
	public int fboardMod(FboardVO vo);
	public int fboardDel(FboardVO vo);
	public List<FboardVO> viewReply(int fno);
	public int replyinsert(FboardVO vo);
	public int replydelete(int fno);
}
