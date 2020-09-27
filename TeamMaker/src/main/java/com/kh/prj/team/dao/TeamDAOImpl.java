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
import com.kh.prj.team.vo.TeammemberVO;

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
	
	/**
	 * 오너 확인
	 */
	@Override
	public String checkowner(int tno) {
		return sqlSession.selectOne("mappers.TeamDAO-mapper.checkowner",tno);
	}
	
	@Override
	public List<TeamVO> myList(String id) {
		return sqlSession.selectList("mappers.TeamDAO-mapper.mylist",id);
	}
	
	@Override
	public List<TeammemberVO> affiliationTno(String id) {
		System.out.println("affiliation id : " + id );
		return sqlSession.selectList("mappers.TeamDAO-mapper.affiliationTno",id);
	}
	
	@Override
	public List<TeamVO> sosok(int tno) {
		return sqlSession.selectList("mappers.TeamDAO-mapper.sosok",tno);
	}
	
	@Override
	public List<ApplyVO> myteam(int tno) {
		return sqlSession.selectList("mappers.TeamDAO-mapper.myteam",tno);
	}
	
	@Override
	public int addmember(TeammemberVO teammemberVO) {
		return sqlSession.insert("mappers.TeamDAO-mapper.addmember", teammemberVO);
	}
	
	@Override
	public List<TeammemberVO> mymember(int tno) {
		return sqlSession.selectList("mappers.TeamDAO-mapper.mymember",tno);
	}
	
	@Override
	public int delapply(int tno) {
		return sqlSession.delete("mappers.TeamDAO-mapper.delapply",tno);
	}
	
	/**
	 * 추방
	 */
	@Override
	public int delMember(TeammemberVO vo) {
		System.out.println(vo.getTno());
		System.out.println(vo.getUserid());
		return sqlSession.delete("mappers.TeamDAO-mapper.delMember",vo);
	}
	
	@Override
	public int checkmember(TeammemberVO vo) {
		return sqlSession.selectOne("mappers.TeamDAO-mapper.checkmember",vo);
	}
	
	
}
