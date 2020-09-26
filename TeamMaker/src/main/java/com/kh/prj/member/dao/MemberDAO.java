package com.kh.prj.member.dao;

import java.util.List;

import com.kh.prj.member.vo.MemberVO;
import com.kh.prj.member.vo.ReportVO;
import com.kh.prj.paging.PagingCriteria;

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
	
	/**
	 * 신구횟수 추가
	 * @param id
	 * @return
	 */
	public int dancnt(String id);
	/**
	 * 신고 횟수 조회
	 * @param id
	 * @return
	 */
	public int getcnt(String id);
	/**
	 * 블랙리스트 추가
	 * @param id
	 * @return
	 */
	public int addBlackList(String id);
	/**
	 * 블랙리스트 아이디 존재 여부 확인
	 * @param id
	 * @return
	 */
	public String checkBlackList(String id);
	
	public int delMember(String id);
	
	public MemberVO memberCheck(MemberVO memberVO);
	public int changePw(MemberVO memberVO);
	
	public int danplus(String id);
	
	public int fcheckreport(ReportVO vo);
	public int freportinsert(ReportVO vo);
	public List<ReportVO> freportlist(PagingCriteria paging);
	public int fgetTotal();
	public int fboardBlind(int fno);
	public int freportdel(int no);
	
	
	public int rcheckreport(ReportVO vo);
	public int rreportinsert(ReportVO vo);
	public List<ReportVO> rreportlist(PagingCriteria paging);
	public int rgetTotal();
}
