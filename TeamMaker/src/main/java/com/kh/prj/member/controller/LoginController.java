package com.kh.prj.member.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.dae.svc.DaeSVC;
import com.kh.prj.dae.vo.DaeVO;
import com.kh.prj.gong.svc.GongSVC;
import com.kh.prj.gong.vo.GongVO;
import com.kh.prj.member.svc.MemberSVC;
import com.kh.prj.member.vo.MemberVO;
import com.kh.prj.recruit.svc.RecruitSVC;
import com.kh.prj.recruit.vo.RecruitVO;

@Controller
public class LoginController {
	@Inject
	MemberSVC memberSVC;
	@Inject
	RecruitSVC recruitSVC;
	@Inject
	DaeSVC daeSVC;
	@Inject
	GongSVC gongSVC;

	@Inject
	BCryptPasswordEncoder pwdEncoder;

	// 로그인 화면
	@GetMapping("loginForm")
	public String loginForm() {
		return "member/signin";
	}

	// 로그인 처리
	/*
	 * @PostMapping("/login") public String login(@RequestParam("id") String
	 * id, @RequestParam("pw") String pw, HttpSession session, Model model) { String
	 * check = memberSVC.checkBlackList(id);
	 * System.out.println("controller check : " + check); //차단아이디 확인 if(check !=
	 * null && check.equals(id)) { return "member/blacklist"; }else { MemberVO
	 * memberVO = memberSVC.listId(id); if(memberVO == null) { return "err_page";
	 * }else { if(memberVO.getPw().equals(pw)) { session.setAttribute("member",
	 * memberVO); session.setAttribute("id",memberVO.getId());
	 * //System.out.println("memberVO : " + memberVO); System.out.println("세션 : " +
	 * session.getAttribute("member")); //return "home"; return "member/success";
	 * }else { return "err_page"; } } } }
	 */

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json")
	public int login(@RequestBody HashMap<String, String> memberInfo, MemberVO memberVO, HttpSession session)
			throws Exception {
		String id = memberInfo.get("id");
		String pw = memberInfo.get("pw");
		int bcheck = memberSVC.checkBlackList(id);
		if (bcheck == 0) {
			memberVO.setId(id);
			MemberVO result = memberSVC.memberCheck(memberVO);
			boolean pwMatch = pwdEncoder.matches(pw, result.getPw());
			if (pwMatch == false) {
				return -1;
			} else {
				session.setAttribute("member", result);
				session.setAttribute("id",id);
				return 1;
			}
		}else {
			return -2;
		}
	}
	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
	 * newMember(HttpServletRequest request, MemberVO memberVO, HttpSession session)
	 * throws Exception { String referer = (String)request.getHeader("Referer");
	 * String check = memberSVC.checkBlackList(memberVO.getId()); MemberVO result =
	 * memberSVC.memberCheck(memberVO); boolean pwMatch =
	 * pwdEncoder.matches(memberVO.getPw(), result.getPw()); if(pwMatch == false) {
	 * return "err_page"; }else { session.setAttribute("member",result);
	 * session.setAttribute("id",memberVO.getId());
	 * request.getSession().setAttribute("redirectURI", referer); return
	 * "redirect:"+referer; } }
	 */

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, Model model, RecruitVO vo) {
		// 세션 정보 제거
		session.invalidate();
		List<RecruitVO> list = recruitSVC.rank();
		List<DaeVO> listdae = daeSVC.rank();
		List<GongVO> listgong = gongSVC.rank();
		model.addAttribute("rank", list);
		model.addAttribute("rankdae", listdae);
		model.addAttribute("rankgong", listgong);
		return "home";
	}
	
	// 테스트
	@GetMapping("/test")
	public String test(HttpSession session, Model model) {
		return "member/test";
	}

}
