package com.kh.prj.teamboard.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.teamboard.dao.TeamboardDAO;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Repository
public class TeamboardSVCImpl implements TeamboardSVC {
	@Inject
	@Qualifier("teamboardDAOImpl")
	TeamboardDAO teamboardDAO;
	
	@Override
	public List<TeamboardVO> boardList(int tno) {
		return teamboardDAO.boardList(tno);
	}
	
	@Override
	public TeamboardVO boardView(int bno) {
		return teamboardDAO.boardView(bno);
	}
	
	@Override
	public int boardWrite(TeamboardVO vo) {
		return teamboardDAO.boardWrite(vo);
	}
	
	@Override
	public int boardDelete(int bno) {
		return teamboardDAO.boardDelete(bno);
	}
	
	@Override
	public int boardMod(TeamboardVO vo) {
		return teamboardDAO.boardMod(vo);
	}
}
