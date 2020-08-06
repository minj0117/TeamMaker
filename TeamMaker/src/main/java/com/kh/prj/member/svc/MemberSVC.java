package com.kh.prj.member.svc;

import java.util.List;

import com.kh.prj.member.vo.MemberVO;

public interface MemberSVC {
	public int joinMember(MemberVO memberVO);
	//회원 id조회
	public MemberVO listId(String id);
	
	public List<MemberVO> memberList();
}
