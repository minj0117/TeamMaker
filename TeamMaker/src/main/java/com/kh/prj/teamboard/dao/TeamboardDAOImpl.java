package com.kh.prj.teamboard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.vo.TeamboardReplyVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Service
public class TeamboardDAOImpl implements TeamboardDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public TeammemberVO checkmember(TeammemberVO teammemberVO) {
		return sqlSession.selectOne("mappers.TeamDAO-mapper.checkmember", teammemberVO);
	}
	
	@Override
	public String checkowner(int tno) {
		String result = sqlSession.selectOne("mappers.TeamDAO-mapper.checkowner", tno);
		return result;
	}
	/**
	 * 팀 게시글 조회
	 */
	@Override
	public List<TeamboardVO> tboardlist(int tno) {
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
	/**
	 * 게시글 삭제
	 */
	@Override
	public int delete(int bno) {
		return sqlSession.delete("mappers.TeamboardDAO-mapper.delete",bno);
	}
	/**
	 * 게시글 수정
	 */
	@Override
	public int modify(TeamboardVO teamboardVO) {
		return sqlSession.update("mappers.TeamboardDAO-mapper.modify",teamboardVO);
	}
	
	
	
	@Override
	public List<TeamboardReplyVO> showreply(int bno) {
		List<TeamboardReplyVO> list = sqlSession.selectList("mappers.TeamboardDAO-mapper.showreply", bno);
		return list;
	}
	
	@Override
	public int writeReply(TeamboardReplyVO teamboardReplyVO) {
		return sqlSession.insert("mappers.TeamboardDAO-mapper.writeReply", teamboardReplyVO);
	}
	
	@Override
	public int modifyReply(TeamboardReplyVO teamboardReplyVO) {
		return sqlSession.update("mappers.TeamboardDAO-mapper.modifyReply", teamboardReplyVO);
	}
	
	@Override
	public int deleteReply(int rno) {
		return sqlSession.delete("mappers.TeamboardDAO-mapper.deleteReply", rno);
	}
	@Override
	public TeamboardReplyVO detailReply(int rno) {
		return sqlSession.selectOne("mappers.TeamboardDAO-mapper.detailreply", rno);
	}
}
