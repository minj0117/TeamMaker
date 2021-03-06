package com.kh.prj.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.apply.svc.ApplySVC;
import com.kh.prj.apply.vo.MyApplyVO;
import com.kh.prj.common.mail.MailService;
import com.kh.prj.member.svc.MemberSVC;
import com.kh.prj.member.vo.MemberVO;
import com.kh.prj.member.vo.ReportVO;
import com.kh.prj.paging.PageMaker;
import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.recruit.svc.RecruitSVC;
import com.kh.prj.recruit.vo.RecruitVO;
import com.kh.prj.tmppw.GetRandomPw;

@Controller
@RequestMapping("/member")
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberSVC memberSVC;
	@Inject
	RecruitSVC recruitSVC;
	@Inject
	ApplySVC applySVC;
	@Autowired
	private MailService mailService;
	@Inject
	private SqlSession sqlSession;

	@Inject
	BCryptPasswordEncoder pwdEncoder;

	/* ===================== 회원 등록 =========================== */
	/**
	 * 회원가입 페이지
	 * 
	 * @return
	 */
	@GetMapping("/joinForm")
	public String joinForm() {
		return "/member/signup";
	}

	/**
	 * 회원가입 처리
	 * 
	 * @param memberVO
	 * @param model
	 * @return
	 */
	/*
	 * @PostMapping("/join") public String join(MemberVO memberVO, Model model) {
	 * int result = memberSVC.joinMember(memberVO); if(result == 1) { return "home";
	 * }else { return "err_page"; } }
	 */
	@ResponseBody
	@RequestMapping(value = "/join", method = RequestMethod.POST, produces = "application/json")
	public int join(@RequestBody HashMap<String, String> memberInfo, MemberVO memberVO) throws Exception {
		memberVO.setId(memberInfo.get("id"));
		String encrypw = memberInfo.get("pw");
		String pw = pwdEncoder.encode(encrypw);
		memberVO.setPw(pw);
		memberVO.setName(memberInfo.get("name"));
		java.sql.Date birth = java.sql.Date.valueOf(memberInfo.get("birth"));
		memberVO.setBirth(birth);
		memberVO.setGender(memberInfo.get("gender"));
		memberVO.setPhone(memberInfo.get("phone"));
		memberVO.setEmail(memberInfo.get("email"));
		memberVO.setFree(memberInfo.get("free"));
		System.out.println(memberVO.toString());
		return memberSVC.joinMember(memberVO);
	}

	/* ===================== 회원 조회 =========================== */
	/**
	 * 회원 리스트 조회
	 * 
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

	/* ===================== 회원 수정 =========================== */
	/**
	 * 회원 수정 페이지
	 * 
	 * @return
	 */
	@GetMapping("/modifyForm")
	public String modifyFrom() {
		return "member/modifyForm";
	}

	/**
	 * 회원 수정 처리
	 * 
	 * @param memberVO
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.PUT, produces = "application/json")
	public int modify(@RequestBody HashMap<String, String> info, MemberVO memberVO) {
		String encrypw = info.get("pw");
		String pw = pwdEncoder.encode(encrypw);
		memberVO.setPw(pw);
		memberVO.setFree(info.get("free"));
		memberVO.setPhone(info.get("phone"));
		memberVO.setEmail(info.get("email"));
		memberVO.setId(info.get("id"));
		return memberSVC.modifyMember(memberVO);
	}

	/**
	 * 아이디 중복체크
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> idCheck(@RequestBody String id) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		int result = 0;
		result = memberSVC.idCheck(id);
		System.out.println("controller : " + result);
		map.put("check", result);
		System.out.println("map : " + map);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST, produces = "application/json")
	public int emailCheck(@RequestBody HashMap<String, String> info) throws Exception {
		String email = info.get("email");
		return memberSVC.emailCheck(email);
	}

	/**
	 * 아이디 찾기 페이지
	 * 
	 * @return
	 */
	@GetMapping("/findIDForm")
	public String findIDFrom() {
		return "member/findID";
	}

	/**
	 * 아이디 찾기 처리
	 * 
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/findid", method = RequestMethod.POST, produces = "application/json")
	public String findid(@RequestBody MemberVO memberVO) throws Exception {
		logger.info(memberVO.toString());
		String result = memberSVC.findid(memberVO);
		System.out.println("컨트롤로 : " + result);
		return result;
	}

	/**
	 * 비밀번호 찾기 페이지
	 * 
	 * @return
	 */
	@GetMapping("/findPWForm")
	public String findPWFrom() {
		return "member/findPWForm";
	}

	/**
	 * 비밀번호 찾기 처리
	 * 
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/findpw", method = RequestMethod.POST, produces = "application/json")
	public int findpw(@RequestBody MemberVO memberVO) throws Exception {
		String tmppw = null;
		logger.info(memberVO.toString());
		String result = memberSVC.findpw(memberVO);
		if (result != null) {
			GetRandomPw tmp = new GetRandomPw();
			tmppw = tmp.getRandomPassword(5);
		}
		mailService.sendMail(memberVO.getEmail(), "임시 비밀번호 입니다.", "회원님의 임시비밀번호 : " + tmppw);
		String encrypw = tmppw;
		String pw = pwdEncoder.encode(encrypw);
		memberVO.setPw(pw);
		return memberSVC.changePw(memberVO);

	}

	/**
	 * 신고횟수 추가
	 * 
	 * @param id
	 * @return
	 */
	@GetMapping("/dancnt")
	public String dancnt(String id) {
		System.out.println(id);
		int result = memberSVC.dancnt(id);
		if (result == 0) {
			return "err_page";
		} else {
			int getcnt = memberSVC.getcnt(id);
			if (getcnt >= 3) { // 신고횟수 3이상이면 블랙리스트 처리
				int result2 = memberSVC.addBlackList(id);
				if (result2 == 0) {
					return "err_page";
				} else {
					return "member/success";
				}
			}
			return "member/success";
		}
	}

	@GetMapping("delMemberForm")
	public String delMemberForm() {
		return "member/delMemberForm";
	}

	@ResponseBody
	@RequestMapping(value="delMember", method=RequestMethod.POST, produces="application/json")
	public int delMember(@RequestBody HashMap<String, String> info, Model model,HttpSession session) {
		String pw = memberSVC.checkpw(info.get("id"));
		boolean pwMatch = pwdEncoder.matches(info.get("pw"), pw);
		if(pwMatch == true) {
			session.invalidate();
			return memberSVC.delMember(info.get("id"));
		}else {
			return -1;
		}
		
	}

	@RequestMapping("mypage")
	public String mypage(HttpSession session, Model model) {
		String id = ((MemberVO) session.getAttribute("member")).getId();
		List<RecruitVO> rlist = recruitSVC.mypagerecruit(id);
		List<MyApplyVO> alist = applySVC.mypageapplylist(id);
		model.addAttribute("rlist", rlist);
		model.addAttribute("alist", alist);
		return "member/mypage";
	}

	@RequestMapping("/profile")
	public String profile(@RequestParam("id") String id, Model model, MemberVO vo) {
		System.out.println("id : " + id);
		vo = memberSVC.listId(id);
		model.addAttribute("vo", vo);
		return "member/profile";
	}

	@RequestMapping("admin")
	public String admin(HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id.equals("admin")) {
			return "member/admin";
		} else {
			return "err_page";
		}
	}

	/* 자유게시판 신고 목록 페이지 */
	@RequestMapping("freport")
	public String freport(Model model, PagingCriteria cri, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id.equals("admin")) {
			List<ReportVO> list = memberSVC.freportlist(cri);
			int total = memberSVC.fgetTotal();
			model.addAttribute("list", list);
			model.addAttribute("paging", new PageMaker(cri, total));
			return "member/freport";
		} else {
			return "err_page";
		}
	}

	/**
	 * 신고목록애 추가
	 * 
	 * @param info
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/freportinsert", method = RequestMethod.POST, produces = "application/json")
	public int freportinsert(@RequestBody HashMap<String, String> info, ReportVO vo) {
		vo.setBno(Integer.parseInt(info.get("bno")));
		vo.setId(info.get("id"));
		vo.setR_comment(info.get("r_comment"));
		int result = memberSVC.fcheckreport(vo); // 이미 신고되어있는지 확인
		if (result == 0) {
			return memberSVC.freportinsert(vo);
		} else {
			return 0;
		}
	}

	/**
	 * 처리 승인
	 * 
	 * @param info
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/freportok", method = RequestMethod.PUT, produces = "application/json")
	public int reportok(@RequestBody HashMap<String, String> info) {
		String id = info.get("id");
		int fno = Integer.parseInt(info.get("bno"));
		memberSVC.fboardBlind(fno);
		memberSVC.dancnt(id);
		int check = memberSVC.getcnt(id);
		if (check >= 3) {
			memberSVC.addBlackList(id);
			memberSVC.freportdel(Integer.parseInt(info.get("no")));
			return 2;
		}
		return memberSVC.freportdel(Integer.parseInt(info.get("no")));
	}

	/**
	 * 처리 거절
	 * 
	 * @param info
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/freportno", method = RequestMethod.DELETE, produces = "application/json")
	public int reportno(@RequestBody HashMap<String, String> info) {
		return memberSVC.freportdel(Integer.parseInt(info.get("no")));
	}

	/* 모집게시판 신고 목록 페이지 */
	@RequestMapping("rreport")
	public String rreport(Model model, PagingCriteria cri, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if(id.equals("admin")) {
		List<ReportVO> list = memberSVC.rreportlist(cri);
		int total = memberSVC.rgetTotal();
		model.addAttribute("list", list);
		model.addAttribute("paging", new PageMaker(cri, total));
		return "member/rreport";
		}else {
			return "err_page";
		}
	}

	/**
	 * 신고목록애 추가
	 * 
	 * @param info
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/rreportinsert", method = RequestMethod.POST, produces = "application/json")
	public int rreportinsert(@RequestBody HashMap<String, String> info, ReportVO vo) {
		vo.setBno(Integer.parseInt(info.get("bno")));
		vo.setId(info.get("id"));
		vo.setR_comment(info.get("r_comment"));

		int result = memberSVC.rcheckreport(vo); // 이미 신고되어있는지 확인
		System.out.println(result);
		if (result == 0) {
			return memberSVC.rreportinsert(vo);
		} else {
			return 0;
		}
	}

	/**
	 * 처리 승인
	 * 
	 * @param info
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/rreportok", method = RequestMethod.PUT, produces = "application/json")
	public int rreportok(@RequestBody HashMap<String, String> info) {
		String id = info.get("id");
		int rno = Integer.parseInt(info.get("bno"));
		memberSVC.recruitBlind(rno);
		memberSVC.dancnt(id);
		int check = memberSVC.getcnt(id);
		if (check >= 3) {
			memberSVC.addBlackList(id);
			memberSVC.rreportdel(Integer.parseInt(info.get("no")));
			return 2;
		}
		return memberSVC.rreportdel(Integer.parseInt(info.get("no")));
	}

	/**
	 * 처리 거절
	 * 
	 * @param info
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/rreportno", method = RequestMethod.DELETE, produces = "application/json")
	public int rreportno(@RequestBody HashMap<String, String> info) {
		return memberSVC.rreportdel(Integer.parseInt(info.get("no")));
	}

}
