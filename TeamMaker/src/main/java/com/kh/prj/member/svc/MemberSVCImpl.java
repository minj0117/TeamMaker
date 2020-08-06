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
	
	@Override
	public int joinMember(MemberVO memberVO) {
		int result = 0;
		result = memberDAO.joinMember(memberVO);
		return result;
	}
	@Override
	public MemberVO listId(String id) {
		MemberVO memberVO = null;
		memberVO = memberDAO.listId(id);
		return memberVO;
	}
	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return memberDAO.memberList();
	}
}
