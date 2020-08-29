package com.kh.prj.teamboard.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.prj.teamboard.vo.TeamboardVO;

@Service
public class TeamboardDAOImpl implements TeamboardDAO {
	@Inject
	SqlSession sqlSession;
	
	/**
	 * 게시글 작성
	 */
	@Override
	public int write(TeamboardVO teamboardVO) {
		return sqlSession.insert("mappers.MemberDAO-mapper.findId",teamboardVO);
	}
}
