package com.kh.prj.apply.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.prj.apply.vo.ApplyVO;

@Repository
public class ApplyDAOImpl implements ApplyDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int check(ApplyVO applyVO) {
		return sqlSession.selectOne("mappers.ApplyDAO-mapper.check",applyVO);
	}
	
	@Override
	public int addlist(ApplyVO applyVO) {
		return sqlSession.insert("mappers.ApplyDAO-mapper.addlist",applyVO);
	}
}
