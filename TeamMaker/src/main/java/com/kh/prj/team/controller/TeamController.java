package com.kh.prj.team.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
			return "member/success";
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
	// @RequestMapping(value = "/mylist/{id}", method = RequestMethod.GET, produces
	// = "application/json" )
	@GetMapping("/mylist/{id}")
	public String memberList(TeamVO teamVO, Model model) {
		String id = teamVO.getOwner();
		List<TeamVO> list = teamSVC.myList(id);
		model.addAttribute("list", list);
		System.out.println("list : " + list.toString());
		return "team/myteam";
	}
	
	@GetMapping("/affiliation/{id}")
	public String myteam(TeammemberVO teammemberVO, Model model) {
		String userid = teammemberVO.getUserid();
		List<TeammemberVO> list = teamSVC.affiliationTno(userid);
		//logger.info("list : " + list.get(0).getTno());
		List<TeamVO> list2 = null;
		//for(TeammemberVO i : list) {
		for(int i=0; i<list.size(); i++) {
			int tno = list.get(i).getTno();
			list2 = teamSVC.sosok(tno);
			System.out.println("acomment : " + list2.get(i).getAcomment());
			System.out.println("acomment : " + list2.get(i).getTitle());
		}	
		model.addAttribute("list", list2);
		return "team/sosok";
	}

	/**
	 * 내팀 지원자 보기
	 */
	@GetMapping("/myteam/{tno}")
	public String myteam(ApplyVO applyVO, Model model) {
		logger.info("들어옴");
		logger.info("applyid : " + applyVO.getApplyid());
		logger.info("tno : " + applyVO.getTno());
		int tno = applyVO.getTno();
		List<ApplyVO> list = teamSVC.myteam(tno);
		model.addAttribute("list", list);
		model.addAttribute("tno", tno);
		return "team/applicantlist";
	}

	/**
	 * 팀원 추가
	 */
	@PostMapping("/addteamuser")
	public String addteamuser(ApplyVO applyVO, HttpServletRequest request) {
		boolean state = true; //한번이라도 실패하면 false
		String[] id = request.getParameterValues("applycant");
		int tno = Integer.parseInt(request.getParameter("tno"));
		if (id.length != 0) {
			TeammemberVO teammemberVO = null;
			for (int i = 0; i < id.length; i++) {
				teammemberVO = new TeammemberVO();
				teammemberVO.setUserid(id[i]);
				teammemberVO.setTno(tno);
				int result = teamSVC.addmember(teammemberVO);
				if(result == 0) {
					state = false;
					return "err_page";
				}
			}
			int result2 = teamSVC.delapply(tno); //팀원 확정 시 지원 목록에서 삭제
		}else {
			return "err_page";
		}
		if(state == true) {
			return "member/success";
		}else {
			return "err_page";
		}
	}
	
	/**
	 * 내 팀원 보기
	 * @param teammemberVO
	 * @param model
	 * @param request
	 * @return
	 */
	@GetMapping("/mymember/{tno}")
	public String myMember(TeammemberVO teammemberVO, Model model, HttpServletRequest request) {
		int tno = Integer.parseInt(request.getParameter("tno"));
		logger.info("tno : " + tno);
		if(tno != 0) {
			List<TeammemberVO> list = teamSVC.mymember(tno);
			model.addAttribute("list",list);
			return "team/mymember";
		}else {
			return "err_page";
		}
	}
}
