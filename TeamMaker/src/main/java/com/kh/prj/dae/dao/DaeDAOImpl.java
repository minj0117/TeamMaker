package com.kh.prj.dae.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.prj.dae.vo.DaeVO;

@Repository
public class DaeDAOImpl implements DaeDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int insertDae(DaeVO daeVO) {
		return sqlSession.insert("mappers.DaeDAO-mapper.insertDae",daeVO);
	}
	
	@Override
	public List<DaeVO> dlist() {
		return sqlSession.selectList("mappers.DaeDAO-mapper.dlist");
	}
	
	@Override
	public DaeVO dview(int dno) {
		return sqlSession.selectOne("mappers.DaeDAO-mapper.dview",dno);
	}
	
	@Override
	public int DaeMod(DaeVO daeVO) {
		return sqlSession.update("mappers.DaeDAO-mapper.daeMod",daeVO);
	}
	
	@Override
	public int del(int dno) {
		return sqlSession.delete("mappers.DaeDAO-mapper.del",dno);
	}
}
