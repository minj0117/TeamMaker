package com.kh.prj.fboard.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.prj.fboard.vo.FboardVO;

@Repository
public class FboardDAOImpl implements FboardDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int write(FboardVO vo) {
		return sqlSession.insert("mappers.FboardDAO-mapper.write",vo);
	}
}
