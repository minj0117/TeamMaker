package com.kh.prj.team.svc;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.apply.vo.ApplyVO;
import com.kh.prj.team.dao.TeamDAO;
import com.kh.prj.team.vo.TeamVO;

@Service
public class TeamSVCImpl implements TeamSVC {
	private Logger logger = LoggerFactory.getLogger(TeamSVCImpl.class);

	@Inject
	@Qualifier("teamDAOImpl")
	TeamDAO teamDAO;
	
	

	@Override
	public int makeTeam(TeamVO teamVO) {
		return teamDAO.makeTeam(teamVO);
	}
	
	@Override
	public List<TeamVO> teamlist() {
		return teamDAO.teamlist();
	}
	
	@Override
	public List<TeamVO> myList(String id) {
		return teamDAO.myList(id);
	}
	
	@Override
	public List<ApplyVO> myteam(int tno) {
		return teamDAO.myteam(tno);
	}

}
