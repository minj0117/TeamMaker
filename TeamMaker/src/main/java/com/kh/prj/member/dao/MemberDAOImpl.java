package com.kh.prj.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.prj.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession sqlSession;
	@Override
	public int joinMember(MemberVO memberVO) {
		
		return sqlSession.insert("mappers.MemberDAO-mapper.joinMember",memberVO);
	}
	
	//회원 id조회
	@Override
	public MemberVO listId(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mappers.MemberDAO-mapper.listId",id);
	}
	
	@Override
	public List<MemberVO> memberList() {
		return sqlSession.selectList("mappers.MemberDAO-mapper.memberList");
	}
}
