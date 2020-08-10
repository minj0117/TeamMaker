package com.kh.prj.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.prj.member.svc.MemberSVC;
import com.kh.prj.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject MemberSVC memberSVC;
	
	/*===================== 회원 등록 ===========================*/
	/**
	 * 회원가입 페이지
	 * @return
	 */
	@GetMapping("/joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	/**
	 * 회원가입 처리
	 * @param memberVO
	 * @param model
	 * @return
	 */
	@PostMapping("/join")
	public String join(MemberVO memberVO, Model model) {
		int result = memberSVC.joinMember(memberVO);
		if(result == 1) {
			return "member/success";
		}else {
			return "err_page";
		}
	}
	

	/*===================== 회원 조회 ===========================*/
	/**
	 * 회원 리스트 조회
	 * @param model
	 * @return
	 */
	@GetMapping("/list")
	public String memberList(Model model) {
		List<MemberVO> list = memberSVC.memberList();
		logger.info("데이터 : " + list);
		model.addAttribute("list", list);
		return "member/list";
	}
	

	/*===================== 회원 수정 ===========================*/
	/**
	 * 회원 수정 페이지
	 * @return
	 */
	@GetMapping("/modifyForm")
	public String modifyFrom() {
		return "member/modifyForm";
	}
	
	/**
	 * 회원 수정 처리
	 * @param memberVO
	 * @param session
	 * @param model
	 * @return
	 */
	@PostMapping("/modify")
	public String modify(MemberVO memberVO, HttpSession session, Model model) {
		int result = memberSVC.modifyMember(memberVO);
		if(result == 1) {
			String id = ((MemberVO) session.getAttribute("member")).getId();
			session.setAttribute("member", memberSVC.listId(id));
			return "member/modifyForm";
		}else {
			return "err_page";
		}
	}
	
	@GetMapping("/overlapped")
	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		System.out.println("overlapped 호출");
		String result = memberSVC.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
}
