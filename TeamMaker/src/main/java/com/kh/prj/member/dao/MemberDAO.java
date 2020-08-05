package com.kh.prj.member.dao;

import com.kh.prj.member.vo.MemberVO;

public interface MemberDAO {
	public int joinMember(MemberVO memberVO);
	//회원 ID조회
	public MemberVO listId(String id);
}
