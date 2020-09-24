package com.kh.prj.gong.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.prj.gong.vo.GongVO;
import com.kh.prj.paging.PagingCriteria;
@Repository
public class GongDAOImpl implements GongDAO {
	private static final Logger logger = LoggerFactory.getLogger(GongDAOImpl.class);

	@Inject
	private SqlSession sqlSession;

	@Override
	public int insertGong(GongVO gongVO) {

		return sqlSession.insert("mappers.GongDAO-mapper.insertGong", gongVO);
	}

	@Override
	public List<GongVO> glist(PagingCriteria paging) {
		System.out.println(paging.getPageNum());
		return sqlSession.selectList("mappers.GongDAO-mapper.glist",paging);
	}

	@Override
	public GongVO gview(int gno) {

		return sqlSession.selectOne("mappers.GongDAO-mapper.gview", gno);
	}

	@Override
	public int GongMod(GongVO gongVO) {

		return sqlSession.update("mappers.GongDAO-mapper.gongMod", gongVO);
	}

	@Override
	public int del(int gno) {
		
		return sqlSession.delete("mappers.GongDAO-mapper.del", gno);
	}
	
	@Override
	public int getTotalCnt() {
		return sqlSession.selectOne("mappers.GongDAO-mapper.getTotalCnt");
	}
}
