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
}
