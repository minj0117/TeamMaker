package com.kh.prj.member.dao;

import java.util.List;

import com.kh.prj.member.vo.MemberVO;

public interface MemberDAO {
	/**
	 * 회원 가입
	 * @param memberVO
	 * @return
	 */
	public int joinMember(MemberVO memberVO);
	
	/**
	 * 회원 ID조회
	 * @param id
	 * @return
	 */
	public MemberVO listId(String id);
	
	public List<MemberVO> memberList();
}
