package com.kh.prj.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.prj.member.svc.MemberSVC;
import com.kh.prj.member.vo.MemberVO;

@Controller
public class LoginController {
	@Inject
	MemberSVC memberSVC;
	
	//로그인 화면
	@GetMapping("loginForm")
	public String loginForm() {
		return "member/signin";
	}
	
	//로그인 처리
	@PostMapping("/login")
	public String login(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session, Model model) {
		String check = memberSVC.checkBlackList(id);
		System.out.println("controller check : " + check);
		//차단아이디 확인
		if(check != null && check.equals(id)) {
			return "member/blacklist";
		}else {
			MemberVO memberVO = memberSVC.listId(id);
			if(memberVO == null) {
				return "err_page";
			}else {
				if(memberVO.getPw().equals(pw)) {
					session.setAttribute("member", memberVO);
					session.setAttribute("id",memberVO.getId());
					//System.out.println("memberVO : " + memberVO);
					System.out.println("memberVO.getId() : " + memberVO.getId());
					return "home";
				}else {
					return "err_page";
				}
			}
		}
	}
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//세션 정보 제거
		session.invalidate();
		return "home";
	}
	
	//테스트
	@GetMapping("/test")
	public String test(HttpSession session, Model model) {
		return "member/test";
	}
	
}
