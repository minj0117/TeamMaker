package com.kh.prj.recruit.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.recruit.dao.RecruitDAO;
import com.kh.prj.recruit.vo.RecruitVO;

@Service
public class RecruitSVCImpl implements RecruitSVC {
	
	@Inject
	@Qualifier("recruitDAOImpl")
	RecruitDAO recruitDAO;
	
	/*@Override
	public List<RecruitVO> recruitList() {
		return recruitDAO.recruitList();
	}*/
	@Override
	public List<RecruitVO> selectBoardList(PagingCriteria paging) {
		List<RecruitVO> list = null;
		list = recruitDAO.selectBoardList(paging);
		return list;
	}
	
	@Override
	public List<RecruitVO> BoardList(RecruitVO recruitVO) {
		return recruitDAO.BoardList(recruitVO);
	}
	
	@Override
	public int insertR(RecruitVO recruitVO) {
		System.out.println(recruitVO.getId() + " " + recruitVO.getRcategory() );
		return recruitDAO.insertR(recruitVO);
	}
	
	@Override
	public RecruitVO viewR(int rno) {
		System.out.println("rno : " + rno);
		return recruitDAO.viewR(rno);
	}
	
	@Override
	public int cntR(int rno) {
		return recruitDAO.cntR(rno);
	}
	
	@Override
	public int addList(RecruitVO recruitVO) {
		return recruitDAO.addTeamList(recruitVO);
	}
	
	@Override
	public int totalCnt() {
		return recruitDAO.totalCnt();
	}
	
	@Override
	public List<RecruitVO> rank() {
		return recruitDAO.rank();
	}
	
	@Override
	public List<RecruitVO> mypagerecruit(String id) {
		return recruitDAO.mypagerecruit(id);
	}
}
