package com.kh.prj.recruit.svc;

import java.util.List;

import com.kh.prj.recruit.vo.RecruitVO;

public interface RecruitSVC {
	public List<RecruitVO> selectBoardList(RecruitVO recuritVO);
	
	public int insertR(RecruitVO recruitVO);
	
	public RecruitVO viewR(int rno);
	
	public int cntR(int rno);
}
