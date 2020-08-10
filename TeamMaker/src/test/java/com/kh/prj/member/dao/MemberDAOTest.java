package com.kh.prj.member.dao;

import javax.inject.Inject;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.prj.member.dao.MemberDAO;
import com.kh.prj.member.vo.MemberVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDAOTest {
	private final static Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);
	
	@Inject
	@Qualifier("memberDAOImpl")
	MemberDAO memberDAO;
	
	@Test
	@DisplayName("회원등록")
	void joinMember() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("testID");
		memberVO.setPw("123123");
		memberVO.setName("테스트");
		memberVO.setBirth(java.sql.Date.valueOf("2020-07-01"));
		memberVO.setGender("여");
		memberVO.setPhone("010-1231-1231");
		memberVO.setEmail("testmail@test.com");
		memberVO.setFree("안녕하세요! 테스트 아이디입니다~~");
		int cnt = memberDAO.joinMember(memberVO);
		logger.info("cnt : " + cnt);
	}
}
