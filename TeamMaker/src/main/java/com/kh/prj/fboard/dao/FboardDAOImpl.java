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
	
	
}
