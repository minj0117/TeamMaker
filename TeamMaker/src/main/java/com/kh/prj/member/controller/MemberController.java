package com.kh.prj.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.prj.member.svc.MemberSVC;
import com.kh.prj.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject MemberSVC memberSVC;
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	@PostMapping("/join")
	public String join(MemberVO memberVO, Model model) {
		int result = memberSVC.joinMember(memberVO);
		if(result == 1) {
			return "member/success";
		}else {
			return "err_page";
		}
	}
	@GetMapping("/list")
	public String memberList(Model model) {
		List<MemberVO> list = memberSVC.memberList();
		logger.info("데이터 : " + list);
		model.addAttribute("list", list);
		return "member/list";
	}
}
