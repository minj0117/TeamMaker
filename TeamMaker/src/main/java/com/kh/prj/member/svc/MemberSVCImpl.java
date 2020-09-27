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
		String result = memberDAO.findid(memberVO);
		return result;
	}
	
	@Override
	public int emailCheck(String email) {
		return memberDAO.emailCheck(email);
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
	public int checkBlackList(String id) {
		return memberDAO.checkBlackList(id);
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
	public int danplus(String id) {
		return memberDAO.dancnt(id);
	}
	
	@Override
	public int fcheckreport(ReportVO vo) {
		return memberDAO.fcheckreport(vo);
	}
	
	@Override
	public int freportinsert(ReportVO vo) {
		return memberDAO.freportinsert(vo);
	}
	
	@Override
	public List<ReportVO> freportlist(PagingCriteria paging) {
		return memberDAO.freportlist(paging);
	}
	@Override
	public int fgetTotal() {
		return memberDAO.fgetTotal();
	}
	@Override
	public int fboardBlind(int fno) {
		return memberDAO.fboardBlind(fno);
	}	
	@Override
	public int freportdel(int no) {
		return memberDAO.freportdel(no);
	}
	
	
	
	@Override
	public int rcheckreport(ReportVO vo) {
		return memberDAO.rcheckreport(vo);
	}
	@Override
	public int rreportinsert(ReportVO vo) {
		return memberDAO.rreportinsert(vo);
	}
	@Override
	public List<ReportVO> rreportlist(PagingCriteria paging) {
		return memberDAO.rreportlist(paging);
	}
	@Override
	public int rgetTotal() {
		return memberDAO.rgetTotal();
	}
	@Override
	public int recruitBlind(int rno) {
		return memberDAO.recruitBlind(rno);
	}
	@Override
	public int rreportdel(int no) {
		return memberDAO.rreportdel(no);
	}
}
