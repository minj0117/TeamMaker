package com.kh.prj.teamboard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.prj.teamboard.vo.TeamboardVO;

@Service
public class TeamboardDAOImpl implements TeamboardDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<TeamboardVO> boardList(int tno) {
		return sqlSession.selectList("mappers.TeamboardDAO-mapper.boardList",tno);
	}
	
	@Override
	public TeamboardVO boardView(int bno) {
		return sqlSession.selectOne("mappers.TeamboardDAO-mapper.boardView",bno);
	}
	
	@Override
	public int boardWrite(TeamboardVO vo) {
		System.out.println(vo.getB_comment());
		System.out.println(vo.getTitle());
		System.out.println(vo.getWriter());
		System.out.println(vo.getTno());
		return sqlSession.insert("mappers.TeamboardDAO-mapper.boardWrite",vo);
	}
	
	@Override
	public int boardDelete(int bno) {
		return sqlSession.delete("mappers.TeamboardDAO-mapper.boardDelete",bno);
	}
	
	@Override
	public int boardMod(TeamboardVO vo) {
		return sqlSession.update("mappers.TeamboardDAO-mapper.boardMod",vo);
	}
}
