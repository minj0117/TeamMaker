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
	
	/**
	 * 아이디 중복 체크
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public int idCheck(String id) throws Exception;
	
	/**
	 * 아이디 찾기
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	public String findid(MemberVO memberVO) throws Exception;
	
	/**
	 * 비밀번호 찾기
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	public String findpw(MemberVO memberVO) throws Exception;
	
	public int dancnt(MemberVO memberVO);
	
}
