package com.kh.prj.fboard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.prj.fboard.vo.FboardVO;
import com.kh.prj.paging.PagingCriteria;

@Repository
public class FboardDAOImpl implements FboardDAO {
	@Inject
	private SqlSession sqlSession;

	@Override
	public int write(FboardVO vo) {
		return sqlSession.insert("mappers.FboardDAO-mapper.write", vo);
	}

	@Override
	public int totalCnt() {
		return sqlSession.selectOne("mappers.FboardDAO-mapper.getTotalCnt");
	}

	@Override
	public List<FboardVO> fboardList(PagingCriteria paging) {
		return sqlSession.selectList("mappers.FboardDAO-mapper.fboardList", paging);
	}

	@Override
	public FboardVO view(int fno) {
		return sqlSession.selectOne("mappers.FboardDAO-mapper.view", fno);
	}
	
	
	@Override
	public int pwCheck(FboardVO vo) {
		return sqlSession.selectOne("mappers.FboardDAO-mapper.pwCheck",vo);
	}
	
	@Override
	public int fboardMod(FboardVO vo) {
		return sqlSession.update("mappers.FboardDAO-mapper.fboardMod",vo);
	}
	
	@Override
	public int fboardDel(FboardVO vo) {
		return sqlSession.delete("mappers.FboardDAO-mapper.fboardDel",vo);
	}
	
	/**
	 * 댓글 보기
	 */
	@Override
	public List<FboardVO> viewReply(int fno) {
		return sqlSession.selectList("mappers.FboardDAO-mapper.viewReply",fno);
	}
	
	@Override
	public int replyinsert(FboardVO vo) {
		return sqlSession.insert("mappers.FboardDAO-mapper.replyinsert",vo);
	}
	
	@Override
	public int replydelete(int fno) {
		return sqlSession.delete("mappers.FboardDAO-mapper.replydelete",fno);
	}
}
