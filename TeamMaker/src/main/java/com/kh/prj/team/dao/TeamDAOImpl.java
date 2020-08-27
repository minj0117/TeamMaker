package com.kh.prj.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.prj.apply.vo.ApplyVO;
import com.kh.prj.team.svc.TeamSVCImpl;
import com.kh.prj.team.vo.TeamVO;

@Repository
public class TeamDAOImpl implements TeamDAO {
	private Logger logger = LoggerFactory.getLogger(TeamSVCImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int makeTeam(TeamVO teamVO) {
		return sqlSession.insert("mappers.TeamDAO-mapper.maketeam",teamVO);
	}
	
	@Override
	public List<TeamVO> teamlist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mappers.TeamDAO-mapper.teamlist");
	}
	
	@Override
	public List<TeamVO> myList(String id) {
		return sqlSession.selectList("mappers.TeamDAO-mapper.mylist",id);
	}
	
	@Override
	public List<ApplyVO> myteam(int tno) {
		return sqlSession.selectList("mappers.TeamDAO-mapper.myteam",tno);
	}
	
}