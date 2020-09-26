package com.kh.prj.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.kh.prj.member.vo.MemberVO;
import com.kh.prj.member.vo.ReportVO;
import com.kh.prj.paging.PagingCriteria;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	/**
	 * 회원가입
	 */
	@Override
	public int joinMember(MemberVO memberVO) {
		return sqlSession.insert("mappers.MemberDAO-mapper.joinMember", memberVO);
	}

	/**
	 * 회원 id조회
	 */
	@Override
	public MemberVO listId(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mappers.MemberDAO-mapper.listId", id);
	}

	/**
	 * 회원 리스트 조회
	 */
	@Override
	public List<MemberVO> memberList() {
		return sqlSession.selectList("mappers.MemberDAO-mapper.memberList");
	}

	/**
	 * 회원 수정
	 */
	@Override
	public int modifyMember(MemberVO memberVO) {
		return sqlSession.update("mappers.MemberDAO-mapper.modifyMember", memberVO);
	}

	/**
	 * 아이디 중복 체크
	 */
	@Override
	public int idCheck(String id) throws Exception {
		System.out.println("dao id : " + id);
		return sqlSession.selectOne("mappers.MemberDAO-mapper.idCheck", id);
	}

	/**
	 * 아이디 찾기
	 */
	@Override
	public String findid(MemberVO memberVO) throws Exception {
		/*
		 * MemberVO memberVO = new MemberVO(); memberVO.setName(name);
		 * memberVO.setEmail(email); System.out.println("dao name : " + name);
		 * System.out.println("dao email : " + email);
		 * System.out.println("dao memberVO : " + memberVO.toString()); String result =
		 * sqlSession.selectOne("mappers.MemberDAO-mapper.findId",memberVO);
		 * System.out.println("dao result ; " + result);
		 */
		String result = sqlSession.selectOne("mappers.MemberDAO-mapper.findId", memberVO);
		System.out.println("dao result ; " + result);
		return result;
	}

	/**
	 * 비밀번호 찾기
	 */
	@Override
	public String findpw(MemberVO memberVO) throws Exception {
		/*
		 * MemberVO memberVO = new MemberVO(); memberVO.setName(name);
		 * memberVO.setEmail(email); System.out.println("dao name : " + name);
		 * System.out.println("dao email : " + email);
		 * System.out.println("dao memberVO : " + memberVO.toString()); String result =
		 * sqlSession.selectOne("mappers.MemberDAO-mapper.findId",memberVO);
		 * System.out.println("dao result ; " + result);
		 */
		String result = sqlSession.selectOne("mappers.MemberDAO-mapper.findPw", memberVO);
		System.out.println("dao result ; " + result);
		return result;
	}

	/**
	 * 신고횟수 추가
	 */
	@Override
	public int dancnt(String id) {
		System.out.println("dao id : " + id);
		/*
		 * int result = sqlSession.selectOne("mappers.MemberDAO-mapper.dancnt", id);
		 * System.out.println("dao result = " + result); return result;
		 */
		int result = sqlSession.update("mappers.MemberDAO-mapper.dancnt", id);
		System.out.println("dao result = " + result);
		return result;
	}

	/**
	 * 블랙리스트 횟수 조회
	 */
	@Override
	public int getcnt(String id) {
		System.out.println("dao id : " + id);
		int result = sqlSession.selectOne("mappers.MemberDAO-mapper.getcnt", id);
		System.out.println("dao result = " + result);
		return result;
	}

	/**
	 * 블랙리스트 추가
	 */
	@Override
	public int addBlackList(String id) {
		System.out.println("dao add id : " + id);
		// int result = sqlSession.insert("mappers.MemberDAO-mapper.addBlackList",id);
		int result = sqlSession.insert("mappers.MemberDAO-mapper.addBlackList", id);
		System.out.println("dao add result : " + result);
		return result;
	}

	/**
	 * 블랙리스트 아이디 존재 여부 확인
	 */
	@Override
	public String checkBlackList(String id) {
		System.out.println("dao check id : " + id);
		String result = sqlSession.selectOne("mappers.MemberDAO-mapper.checkBlackList", id);
		System.out.println("dao check result : " + result);
		return result;
	}

	@Override
	public int delMember(String id) {
		System.out.println("dao id : " + id);
		int result = sqlSession.delete("mappers.MemberDAO-mapper.delMember", id);
		return result;
	}
	
	@Override
	public MemberVO memberCheck(MemberVO memberVO) {
		return sqlSession.selectOne("mappers.MemberDAO-mapper.memberCheck",memberVO);
	}
	
	@Override
	public int changePw(MemberVO memberVO) {
		System.out.println("dao pw : " + memberVO.getPw());
		return sqlSession.update("mappers.MemberDAO-mapper.changePw",memberVO);
	}
	
	
	@Override
	public int danplus(String id) {
		return sqlSession.update("mappers.MemberDAO-mapper.danplus", id);
	}
	
	@Override
	public int fcheckreport(ReportVO vo) {
		return sqlSession.selectOne("mappers.MemberDAO-mapper.fcheckreport", vo);
	}
	
	@Override
	public int freportinsert(ReportVO vo) {
		return sqlSession.insert("mappers.MemberDAO-mapper.freportinsert",vo);
	}
	@Override
	public List<ReportVO> freportlist(PagingCriteria paging) {
		return sqlSession.selectList("mappers.MemberDAO-mapper.freportlist",paging);
	}
	@Override
	public int fgetTotal() {
		return sqlSession.selectOne("mappers.MemberDAO-mapper.fgetTotal");
	}
	@Override
	public int fboardBlind(int fno) {
		return sqlSession.update("mappers.MemberDAO-mapper.fboardBlind", fno);
	}
	@Override
	public int freportdel(int no) {
		return sqlSession.delete("mappers.MemberDAO-mapper.freportdel", no);
	}
	
	
	@Override
	public int rcheckreport(ReportVO vo) {
		return sqlSession.selectOne("mappers.MemberDAO-mapper.rcheckreport", vo);
	}
	@Override
	public int rreportinsert(ReportVO vo) {
		System.out.println("dao  id: " + vo.getId());
		System.out.println("dao  com: " + vo.getR_comment());
		System.out.println("dao  bno: " + vo.getBno());
		return sqlSession.selectOne("mappers.MemberDAO-mapper.rreportinsert",vo);
	}
	@Override
	public List<ReportVO> rreportlist(PagingCriteria paging) {
		return sqlSession.selectList("mappers.MemberDAO-mapper.rreportlist",paging);
	}
	@Override
	public int rgetTotal() {
		return sqlSession.selectOne("mappers.MemberDAO-mapper.rgetTotal");
	}
}
