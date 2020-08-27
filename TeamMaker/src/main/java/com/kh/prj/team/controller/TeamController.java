package com.kh.prj.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.prj.apply.vo.ApplyVO;
import com.kh.prj.team.svc.TeamSVC;
import com.kh.prj.team.vo.TeamVO;

@Controller
public class TeamController {
	private Logger logger = LoggerFactory.getLogger(TeamController.class);

	@Inject
	TeamSVC teamSVC;
	
	@GetMapping("/teamForm")
	public String teamForm() {
		return "team/teamForm";
	}
	
	@PostMapping("/maketeam")
	public String makeTeam(TeamVO teamVO) {
		int result = teamSVC.makeTeam(teamVO);
		if(result == 1) {
			return "member/success";
		}else {
			return "err_page";
		}
	}
	
	@GetMapping("/tlist")
	public String teamList(Model model) {
		List<TeamVO> list = teamSVC.teamlist();
		logger.info("데이터 : " + list);
		model.addAttribute("list", list);
		return "team/list";
	}
	
	//@RequestMapping(value = "/mylist/{id}", method = RequestMethod.GET, produces = "application/json" )
	@GetMapping("/mylist/{id}")
	public String memberList(TeamVO teamVO, Model model) {
		logger.info("id : " + teamVO.getOwner());
		String id = teamVO.getOwner();
		List<TeamVO> list = teamSVC.myList(id);
		model.addAttribute("list",list);
		System.out.println("list : " + list.toString());
		return "team/myteam";
	}
	
	/**
	 * 내팀 지원자 보기
	 */
	@GetMapping("/myteam/{tno}")
	public String myteam(ApplyVO applyVO, Model model) {
		logger.info("applyid : " + applyVO.getApplyid());
		logger.info("tno : " + applyVO.getTno());
		int tno = applyVO.getTno();
		List<ApplyVO> list = teamSVC.myteam(tno);
		model.addAttribute("list", list);
		return "team/applicantlist";
	}
}
