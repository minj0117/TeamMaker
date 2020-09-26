package com.kh.prj.member.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.member.dao.MemberDAO;
import com.kh.prj.member.vo.MemberVO;
import com.kh.prj.member.vo.ReportVO;
import com.kh.prj.paging.PagingCriteria;

@Service
public class MemberSVCImpl implements MemberSVC {
	@Inject
	@Qualifier("memberDAOImpl")
	MemberDAO memberDAO;

	/*
	 * 회원가입
	 */
	@Override
	public int joinMember(MemberVO memberVO) {
		int result = 0;
		result = memberDAO.joinMember(memberVO);
		return result;
	}

	/**
	 * 회원 id조회
	 */
	@Override
	public MemberVO listId(String id) {
		MemberVO memberVO = null;
		memberVO = memberDAO.listId(id);
		return memberVO;
	}

	/**
	 * 회원 리스트 조회
	 */
	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return memberDAO.memberList();
	}

	/**
	 * 회원 수정
	 */
	@Override
	public int modifyMember(MemberVO memberVO) {
		int result = 0;
		result = memberDAO.modifyMember(memberVO);
		return result;
	}

	/**
	 * 아이디 중복 체크
	 */
	@Override
	public int idCheck(String id) throws Exception {
		System.out.println("svc id : " + id);
		return memberDAO.idCheck(id);
	}

	/**
	 * 아이디 찾기
	 */
	@Override
	public String findid(MemberVO memberVO) throws Exception {
		System.out.println("svc name : " + memberVO.getName());
		System.out.println("svc email : " + memberVO.getEmail());
		String result = memberDAO.findid(memberVO);
		System.out.println("svc result ; " + result);
		return result;
	}

	/**
	 * 비밀번호 찾기
	 */
	@Override
	public String findpw(MemberVO memberVO) throws Exception {
		System.out.println("svc id : " + memberVO.getId());
		System.out.println("svc email : " + memberVO.getEmail());
		String result = memberDAO.findpw(memberVO);
		System.out.println("svc result ; " + result);
		return result;
	}

	/**
	 * 신고횟수 추가
	 */
	@Override
	public int dancnt(String id) {
		System.out.println(id);
		int result = memberDAO.dancnt(id);
		System.out.println("svc result = " + result);
		return result;
	}
	/**
	 * 신고 횟수 가져오기
	 */
	@Override
	public int getcnt(String id) {
		System.out.println("svc id : " + id);
		int result = memberDAO.getcnt(id);
		System.out.println("svc result = " + result);
		return result;
	}
	/**
	 * 블랙리스트 추가
	 */
	@Override
	public int addBlackList(String id) {
		System.out.println("svc add id : " + id);
		int result = memberDAO.addBlackList(id);
		System.out.println("svc add result : " + result);
		return result;
	}
	/**
	 * 블랙리스트 아이디 존재 여부 확인
	 */
	@Override
	public String checkBlackList(String id) {
		System.out.println("svc check id : " + id);
		String result = memberDAO.checkBlackList(id);
		System.out.println("svc check result : " + result);
		return result;
	}
	
	@Override
	public int delMember(String id) {
		System.out.println("svc id : " + id);
		int result = memberDAO.delMember(id);
		return result;
	}
	
	@Override
	public MemberVO memberCheck(MemberVO memberVO) {
		return memberDAO.memberCheck(memberVO);
	}
	
	@Override
	public int changePw(MemberVO memberVO) {
		return memberDAO.changePw(memberVO);
	}
	
	@Override
	public int checkreport(ReportVO vo) {
		return memberDAO.checkreport(vo);
	}
	
	@Override
	public int reportinsert(ReportVO vo) {
		return memberDAO.reportinsert(vo);
	}
	
	@Override
	public List<ReportVO> reportlist(PagingCriteria paging) {
		return memberDAO.reportlist(paging);
	}
	@Override
	public int getTotal() {
		return memberDAO.getTotal();
	}
}
