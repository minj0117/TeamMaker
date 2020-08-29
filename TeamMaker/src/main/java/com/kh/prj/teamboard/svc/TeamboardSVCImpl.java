package com.kh.prj.teamboard.svc;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.prj.teamboard.dao.TeamboardDAO;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Repository
public class TeamboardSVCImpl implements TeamboardSVC {
	@Inject
	@Qualifier("teamboardDAOImpl")
	TeamboardDAO teamboardDAO;
	
	/**
	 * 게시글 작성
	 */
	@Override
	public int write(TeamboardVO teamboardVO) {
		return teamboardDAO.write(teamboardVO);
	}
}
