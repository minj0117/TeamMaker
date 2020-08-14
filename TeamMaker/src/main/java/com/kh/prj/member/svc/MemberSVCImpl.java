package com.kh.prj.member.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.member.dao.MemberDAO;
import com.kh.prj.member.vo.MemberVO;

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

	@Override
	public int dancnt(MemberVO memberVO) {
		int result = memberDAO.dancnt(memberVO);
		return result;
	}
}
