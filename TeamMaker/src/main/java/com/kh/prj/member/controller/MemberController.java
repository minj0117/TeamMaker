package com.kh.prj.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.member.svc.MemberSVC;
import com.kh.prj.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject MemberSVC memberSVC;
	@Inject
	private SqlSession sqlSession;
	
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
			return "home";
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
		logger.info(memberVO.toString());
		String result = memberSVC.findpw(memberVO);
		System.out.println("컨트롤로 : " + result);
		return result;
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
}
