package com.kh.prj.recruit.dao;

import java.util.List;

import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.recruit.vo.CheckVO;
import com.kh.prj.recruit.vo.RecruitVO;

public interface RecruitDAO {
	//public List<RecruitVO> recruitList();
	public List<RecruitVO> selectBoardList(PagingCriteria paging);
	public List<RecruitVO> BoardList(RecruitVO recruitVO);
	
	public int insertR(RecruitVO recruitVO);
	
	public RecruitVO viewR(int rno);
	
	public int cntR(int rno);
	
	public int addTeamList(RecruitVO recruitVO);
	
	//글 갯수
	public int totalCnt();
	
	//랭킹
	public List<RecruitVO> rank();
	public List<RecruitVO> mypagerecruit(String id);
	
	public List<RecruitVO> checklist(PagingCriteria paging);
	public int selectTotalCnt(PagingCriteria paging);
}
