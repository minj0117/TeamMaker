package com.kh.prj.teamboard.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.dao.TeamboardDAO;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Repository
public class TeamboardSVCImpl implements TeamboardSVC {
	@Inject
	@Qualifier("teamboardDAOImpl")
	TeamboardDAO teamboardDAO;
	
	@Override
	public String checkmember(TeammemberVO teammemberVO) {
		System.out.println(teammemberVO.toString());
		return teamboardDAO.checkmember(teammemberVO);
	}
	
	@Override
	public String checkowner(int tno) {
		return teamboardDAO.checkowner(tno);
	}
	
	@Override
	public List<TeamboardVO> tboardlist(int tno) {
		return teamboardDAO.tboardlist(tno);
	}
	
	@Override
	public TeamboardVO tboarddetail(int bno) {
		return teamboardDAO.tboarddetail(bno);
	}
	@Override
	public int tboardcnt(int bno) {
		return teamboardDAO.tboardcnt(bno);
	}
	
	/**
	 * 게시글 작성
	 */
	@Override
	public int write(TeamboardVO teamboardVO) {
		return teamboardDAO.write(teamboardVO);
	}
}
