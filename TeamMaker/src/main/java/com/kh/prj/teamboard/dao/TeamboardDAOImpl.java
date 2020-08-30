package com.kh.prj.teamboard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Service
public class TeamboardDAOImpl implements TeamboardDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public String checkmember(TeammemberVO teammemberVO) {
		return sqlSession.selectOne("mappers.TeamDAO-mapper.checkmember", teammemberVO);
	}
	
	@Override
	public String checkowner(int tno) {
		//System.out.println(teammemberVO.getTno() + teammemberVO.getUserid());
		String result = sqlSession.selectOne("mappers.TeamDAO-mapper.checkowner", tno);
		System.out.println("result : " + result);
		return result;
	}
	/**
	 * 팀 게시글 조회
	 */
	@Override
	public List<TeamboardVO> tboardlist(int tno) {
		System.out.println("들어옴");
		return sqlSession.selectList("mappers.TeamboardDAO-mapper.tboardlist", tno);
		
	}
	/**
	 * 게시글 상세조회
	 */
	@Override
	public TeamboardVO tboarddetail(int bno) {
		return sqlSession.selectOne("mappers.TeamboardDAO-mapper.tboarddetail", bno);
	}
	
	@Override
	public int tboardcnt(int bno) {
		System.out.println("dao : " + bno);
		return sqlSession.update("mappers.TeamboardDAO-mapper.tboardcnt",bno);
	}
	
	/**
	 * 게시글 작성
	 */
	@Override
	public int write(TeamboardVO teamboardVO) {
		return sqlSession.insert("mappers.TeamboardDAO-mapper.write",teamboardVO);
	}
}
