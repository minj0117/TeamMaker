package com.kh.prj.fboard.svc;

import java.util.List;

import com.kh.prj.fboard.vo.FboardVO;
import com.kh.prj.paging.PagingCriteria;

public interface FboardSVC {
	public int write(FboardVO vo);
	public int totalCnt();
	public List<FboardVO> fboardList(PagingCriteria paging);
	public FboardVO view(int fno);
	public List<FboardVO> viewReply(int fgroup);
}
