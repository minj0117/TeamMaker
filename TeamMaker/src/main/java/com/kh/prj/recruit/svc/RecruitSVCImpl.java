package com.kh.prj.recruit.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
	public List<RecruitVO> selectBoardList(RecruitVO recruitVO) {
		List<RecruitVO> list = null;
		list = recruitDAO.selectBoardList(recruitVO);
		return list;
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
}
