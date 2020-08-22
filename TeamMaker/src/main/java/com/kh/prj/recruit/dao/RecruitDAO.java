package com.kh.prj.recruit.dao;

import java.util.List;

import com.kh.prj.recruit.vo.RecruitVO;

public interface RecruitDAO {
	//public List<RecruitVO> recruitList();
	public List<RecruitVO> selectBoardList(RecruitVO recruitVO);
	
	public int insertR(RecruitVO recruitVO);
	
	public RecruitVO viewR(int rno);
	
	public int cntR(int rno);
}
