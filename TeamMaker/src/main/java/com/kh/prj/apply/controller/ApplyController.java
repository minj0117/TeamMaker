package com.kh.prj.apply.controller;

import java.util.HashMap;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.apply.svc.ApplySVC;
import com.kh.prj.apply.vo.ApplyVO;
import com.kh.prj.team.svc.TeamSVC;
import com.kh.prj.team.vo.TeammemberVO;



@Controller
public class ApplyController {
	private Logger logger = LoggerFactory.getLogger(ApplyController.class);

	@Inject
	ApplySVC applySVC;
	@Inject
	TeamSVC	teamSVC;
	
	/**
	 * 팀에 지원하기
	 * @param applyVO
	 * @return
	 */
//	@GetMapping("/addapply")
//	public String addapply(ApplyVO applyVO) {
//		int result = applySVC.check(applyVO);
//		if(result == 0) {
//			int result2 = applySVC.addlist(applyVO);
//			if(result2 != 0) {
//				return "redirect:rlist.do";
//			}else {
//				return "err_page";
//			}
//		}else {
//			System.out.println("이미 신청했습니다.");
//			return "err_page";
//		}
//	}
	@ResponseBody
	@RequestMapping(value="/addapply", method=RequestMethod.POST, produces="application/json")
	public int addapply(@RequestBody HashMap<String, String> info, ApplyVO vo, TeammemberVO teamvo) {
		vo.setApplyid(info.get("id"));
		vo.setTno(Integer.parseInt(info.get("tno")));
		teamvo.setUserid(info.get("id"));
		teamvo.setTno(Integer.parseInt(info.get("tno")));
		int result = applySVC.check(vo);
		int checkmem = teamSVC.checkmember(teamvo);
		if(result == 0 && checkmem == 0) {
			return applySVC.addlist(vo);
		}else if( result != 0 && checkmem == 0){
			return -1;
		}else {
			return -2;
		}
	}
}
