package com.kh.prj.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

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
	
	/**
	 * 회원 조회
	 * @return
	 */
	public List<MemberVO> memberList();
	
	/**
	 * 회원 수정 
	 * @param memberVO
	 * @return
	 */
	public int modifyMember(MemberVO memberVO);
	
	public String selectOverlappedID(String id) throws DataAccessException;
}
