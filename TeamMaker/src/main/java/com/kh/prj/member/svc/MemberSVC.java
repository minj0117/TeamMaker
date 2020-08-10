package com.kh.prj.member.svc;

import java.util.List;

import com.kh.prj.member.vo.MemberVO;

public interface MemberSVC {
	/**
	 * 회원 가입
	 * @param memberVO
	 * @return
	 */
	public int joinMember(MemberVO memberVO);
	
	/**
	 * 회원 아이디 조회
	 * @param id
	 * @return
	 */
	public MemberVO listId(String id);
	
	/**
	 * 회원 리스트 조회
	 * @return
	 */
	public List<MemberVO> memberList();
	
	/**
	 * 회원 수정
	 * @param memberVO
	 * @return
	 */
	public int modifyMember(MemberVO memberVO);
	
	public String overlapped(String id) throws Exception;
}
