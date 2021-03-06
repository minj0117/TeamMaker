package com.kh.prj.team.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.apply.vo.ApplyVO;
import com.kh.prj.team.svc.TeamSVC;
import com.kh.prj.team.vo.TeamVO;
import com.kh.prj.team.vo.TeammemberVO;

@Controller
public class TeamController {
	private Logger logger = LoggerFactory.getLogger(TeamController.class);

	@Inject
	TeamSVC teamSVC;

	/**
	 * 팀 생성 페이지 이동
	 * 
	 * @return
	 */
	@GetMapping("/teamForm")
	public String teamForm() {
		return "team/teamForm";
	}

	/**
	 * 팀 생성
	 * 
	 * @param teamVO
	 * @return
	 */
	@PostMapping("/maketeam")
	public String makeTeam(TeamVO teamVO) {
		int result = teamSVC.makeTeam(teamVO);
		if (result == 1) {
			return "redirect:member/mypage";
		} else {
			return "err_page";
		}
	}

	/**
	 * 팀 리스트
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/tlist")
	public String teamList(Model model) {
		List<TeamVO> list = teamSVC.teamlist();
		logger.info("데이터 : " + list);
		model.addAttribute("list", list);
		return "team/list";
	}

	/**
	 * 내가 만든 팀 보기
	 * 
	 * @param teamVO
	 * @param model
	 * @return
	 */
	/*
	 * @GetMapping("/mylist/{id}") public String memberList(TeamVO
	 * teamVO,TeammemberVO teammemberVO, Model model) { String id =
	 * teamVO.getOwner(); List<TeamVO> list = teamSVC.myList(id);
	 * model.addAttribute("list", list); System.out.println("list : " +
	 * list.toString()); return "team/myteam"; }
	 */
	@GetMapping("/mylist")
	public String memberList(TeamVO teamVO, TeammemberVO teammemberVO, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("controller id : " + id);
		List<TeamVO> list = teamSVC.myList(id);
		List<TeammemberVO> list2 = teamSVC.affiliationTno(id);
		// List<TeamVO> list2 = null;
		/*
		 * for(int i=0; i<slist.size(); i++) { int tno = slist.get(i).getTno(); list2 =
		 * teamSVC.sosok(tno); }
		 */
		model.addAttribute("list2", list2); // 속한팀
		model.addAttribute("list", list); // 만든팀
		System.out.println("list : " + list.toString());
		return "team/myteam";
	}

	/**
	 * 소속팀 보기
	 * 
	 * @param teammemberVO
	 * @param model
	 * @return
	 */
	/*
	 * @GetMapping("/affiliation/{id}") public String myteam(TeammemberVO
	 * teammemberVO, Model model) { String userid = teammemberVO.getUserid();
	 * List<TeammemberVO> list = teamSVC.affiliationTno(userid); List<TeamVO> list2
	 * = null; for(int i=0; i<list.size(); i++) { int tno = list.get(i).getTno();
	 * list2 = teamSVC.sosok(tno); } model.addAttribute("list", list2); return
	 * "team/sosok"; }
	 */
	/**
	 * 내팀 지원자 보기
	 */
	@GetMapping("/myteam/{tno}")
	public String myteam(ApplyVO applyVO, Model model) {
		int tno = applyVO.getTno();
		List<ApplyVO> list = teamSVC.myteam(tno);
		model.addAttribute("list", list);
		model.addAttribute("tno", tno);
		return "team/applicantlist";
	}

	/**
	 * 팀원 추가
	 */
	/*
	 * @PostMapping("/addteamuser") public String addteamuser(ApplyVO applyVO,
	 * HttpServletRequest request) { boolean state = true; //한번이라도 실패하면 false
	 * String[] id = request.getParameterValues("applycant"); int tno =
	 * Integer.parseInt(request.getParameter("tno")); if (id.length != 0) {
	 * TeammemberVO teammemberVO = null; for (int i = 0; i < id.length; i++) {
	 * teammemberVO = new TeammemberVO(); teammemberVO.setUserid(id[i]);
	 * teammemberVO.setTno(tno); int result = teamSVC.addmember(teammemberVO);
	 * if(result == 0) { state = false; return "err_page"; } } int result2 =
	 * teamSVC.delapply(tno); //팀원 확정 시 지원 목록에서 삭제 }else { return "err_page"; }
	 * if(state == true) { return "member/success"; }else { return "err_page"; } }
	 */
	@ResponseBody
	@RequestMapping(value = "/addteamuser", method = RequestMethod.POST, produces = "application/json")
	public int addteamuser(@RequestBody HashMap<String, String> info, TeammemberVO vo) {
		int tno = Integer.parseInt(info.get("tno"));
		String applyid = info.get("applyid");
		vo.setTno(tno);
		vo.setUserid(applyid);
		int result = teamSVC.addmember(vo);
		if (result == 1) {
			teamSVC.delapply(tno);
		}
		return result;
	}

	/**
	 * 내 팀원 보기
	 * 
	 * @param teammemberVO
	 * @param model
	 * @param request
	 * @return
	 */
	@GetMapping("/mymember/{tno}")
	public String myMember(TeammemberVO teammemberVO, Model model, HttpServletRequest request, HttpSession session) {
		int tno = Integer.parseInt(request.getParameter("tno"));
		String id = (String) session.getAttribute("id");
		if (tno != 0) {
			String owner = teamSVC.checkowner(tno);
			if (id.equals(owner)) {
				List<ApplyVO> alist = teamSVC.myteam(tno);
				model.addAttribute("alist", alist);
				logger.info("tno : " + tno);
				List<TeammemberVO> list = teamSVC.mymember(tno);
				model.addAttribute("tno", tno);
				model.addAttribute("list", list);
				return "team/mymember";
			} else {
				return "err_page";
			}
		} else {
			return "err_page";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/delMember", method = RequestMethod.POST, produces = "application/json")
	public int delMember(@RequestBody HashMap<String, String> info, TeammemberVO vo) {
		vo.setUserid(info.get("userid"));
		vo.setTno(Integer.parseInt(info.get("tno")));
		return teamSVC.delMember(vo);
	}
}
