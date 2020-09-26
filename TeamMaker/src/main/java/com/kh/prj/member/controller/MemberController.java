package com.kh.prj.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	@Inject MemberSVC memberSVC;
	@Inject RecruitSVC recruitSVC;
	@Inject ApplySVC applySVC;
	@Inject
	private SqlSession sqlSession;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	/*===================== 회원 등록 ===========================*/
	/**
	 * 회원가입 페이지
	 * @return
	 */
	@GetMapping("/joinForm")
	public String joinForm() {
		return "/member/signup";
	}
	/**
	 * 회원가입 처리
	 * @param memberVO
	 * @param model
	 * @return
	 */
	/*
	@PostMapping("/join")
	public String join(MemberVO memberVO, Model model) {
		int result = memberSVC.joinMember(memberVO);
		if(result == 1) {
			return "home";
		}else {
			return "err_page";
		}
	}*/
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
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.PUT, produces = "application/json")
	public int modify(@RequestBody HashMap<String, String> info ,MemberVO memberVO) {
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
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> idCheck(@RequestBody String id) throws Exception{
		Map<Object,Object> map = new HashMap<Object,Object>();
		int result = 0;
		result = memberSVC.idCheck(id);
		System.out.println("controller : " + result );
		map.put("check",result);
		System.out.println("map : " + map);
		return map;
	}	
	
	/**
	 * 아이디 찾기 페이지
	 * @return
	 */
	@GetMapping("/findIDForm")
	public String findIDFrom() {
		return "member/findID";
	}
	
	/**
	 * 아이디 찾기 처리
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/findid", method = RequestMethod.POST, produces = "application/json" )
	public String findid(@RequestBody MemberVO memberVO ) throws Exception {
		logger.info(memberVO.toString());
		String result = memberSVC.findid(memberVO);
		System.out.println("컨트롤로 : " + result);
		return result;
	}
	
	/**
	 * 비밀번호 찾기 페이지
	 * @return
	 */
	@GetMapping("/findPWForm")
	public String findPWFrom() {
		return "member/findPWForm";
	}
	
	/**
	 * 비밀번호 찾기 처리
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/findpw", method = RequestMethod.POST, produces = "application/json" )
	public String findpw(@RequestBody MemberVO memberVO ) throws Exception {
		String tmppw = null;
		logger.info(memberVO.toString());
		String result = memberSVC.findpw(memberVO);
		if(result != null) {
			GetRandomPw tmp = new GetRandomPw();
			tmppw = tmp.getRandomPassword(5);
		}
		String encrypw = tmppw;
		String pw = pwdEncoder.encode(encrypw);
		System.out.println("pw : " + pw);
		memberVO.setPw(pw);
		memberSVC.changePw(memberVO);
		System.out.println(tmppw);
		return tmppw;
	}
	
	/**
	 * 신고횟수 추가
	 * @param id
	 * @return
	 */
	@GetMapping("/dancnt")
	public String dancnt(String id) {
		System.out.println(id);
		int result = memberSVC.dancnt(id);
		System.out.println("controller result = " + result);
		if(result == 0) {
			System.out.println("실패");
			return "err_page";
		}else {
			System.out.println("성공");
			int getcnt = memberSVC.getcnt(id);
			if(getcnt >= 3) { //신고횟수 3이상이면 블랙리스트 처리
				System.out.println("여기까지는 들어옴");
				int result2 = memberSVC.addBlackList(id);
				System.out.println("result2 : " + result2);
				if(result2 == 0 ) {
					System.out.println("블랙리스트 추가 실패");
					return "err_page";
				}else {
					System.out.println("블랙리스트 추가 성공");
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
	@PostMapping("delMember")
	public String delMember(@RequestParam("pw") String pw, Model model ,HttpSession session) {
		String id = ((MemberVO) session.getAttribute("member")).getId();
		String originalPw = ((MemberVO) session.getAttribute("member")).getPw();
		System.out.println("id : " + id);
		System.out.println("originalPw : " + originalPw);
		System.out.println("pw : " + pw);
		if(originalPw.equals(pw)) {
			System.out.println("여기들어옴");
			int result = memberSVC.delMember(id);
			System.out.println("delmember controller result : " + result);
			if(result == 1) {
				session.removeAttribute(id);;
				return "member/success";
			}else {
				return "err_page";
			}
		}else {
			return "err_page";
		}
	}
	
	@RequestMapping("mypage")
	public String mypage(HttpSession session, Model model) {
		String id = ((MemberVO) session.getAttribute("member")).getId();
		List<RecruitVO> rlist = recruitSVC.mypagerecruit(id);
		List<MyApplyVO> alist = applySVC.mypageapplylist(id);
		model.addAttribute("rlist",rlist);
		model.addAttribute("alist",alist);
		return "member/mypage";
	}
	
	@RequestMapping("/profile")
	public String profile(@RequestParam("id") String id , Model model, MemberVO vo) {
		System.out.println("id : " + id);
		vo = memberSVC.listId(id);
		model.addAttribute("vo",vo);
		return "member/profile";
	}
	
	
	/* 관리자 페이지 */
	@RequestMapping("admin")
	public String admin(Model model, PagingCriteria cri) {
		List<ReportVO> list = memberSVC.reportlist(cri);
		int total = memberSVC.getTotal();
		model.addAttribute("list",list);
		model.addAttribute("paging",new PageMaker(cri,total));
		return "member/admin";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/reportinsert", method = RequestMethod.POST, produces = "application/json") 
	public int reportinsert(@RequestBody HashMap<String, String> info, ReportVO vo){
		vo.setBno(Integer.parseInt(info.get("bno")));
		vo.setId(info.get("id"));
		vo.setR_comment(info.get("r_comment"));
		int result = memberSVC.checkreport(vo);
		if( result == 0 ) {
			return memberSVC.reportinsert(vo);
		}else {
			return 0;
		}
	}
}
