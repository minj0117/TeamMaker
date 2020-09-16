package com.kh.prj.recruit.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.recruit.vo.RecruitVO;

@Repository
public class RecruitDAOImpl implements RecruitDAO {
	@Inject
	private SqlSession sqlSession;
	
	/*@Override
	public List<RecruitVO> recruitList() {
		return sqlSession.selectList("mappers.RecruitDAO-mapper.listRboard");
	}*/
	@Override
	public List<RecruitVO> selectBoardList(PagingCriteria paging) {
		System.out.println("paging : " + paging);
		return sqlSession.selectList("mappers.RecruitDAO-mapper.listRboard",paging);
	}
	
	@Override
	public List<RecruitVO> BoardList(RecruitVO recruitVO) {
		return sqlSession.selectList("mappers.RecruitDAO-mapper.list",recruitVO);
	}
	
	@Override
	public int insertR(RecruitVO recruitVO) {
		return sqlSession.insert("mappers.RecruitDAO-mapper.insertRboard", recruitVO);
	}
	
	@Override
	public RecruitVO viewR(int rno) {
		return sqlSession.selectOne("mappers.RecruitDAO-mapper.viewRboard",rno);
	}
	
	@Override
	public int cntR(int rno) {
		return sqlSession.update("mappers.RecruitDAO-mapper.viewCntPlus",rno);
	}
	@Override
	public int addTeamList(RecruitVO recruitVO) {
		return sqlSession.insert("mappers.RecruitDAO-mapper.insertTeamlist", recruitVO);
	}
	
	@Override
	public int totalCnt() {
		return sqlSession.selectOne("mappers.RecruitDAO-mapper.getTotalCnt");
	}
	
	
}
