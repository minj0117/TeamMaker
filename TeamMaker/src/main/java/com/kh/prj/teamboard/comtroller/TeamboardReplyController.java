package com.kh.prj.teamboard.comtroller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.teamboard.svc.TeamboardSVC;
import com.kh.prj.teamboard.vo.TeamboardReplyVO;

@Controller
public class TeamboardReplyController {
	@Inject
	TeamboardSVC teamboardSVC;
	
	/**
	 * 댓글 달기
	 * @param teamboardReplyVO
	 * @param model
	 * @return
	 */
	@PostMapping("/writeReply")
	public String writeReply(TeamboardReplyVO teamboardReplyVO, Model model) {
		int result = teamboardSVC.writeReply(teamboardReplyVO);
		if(result != 0) {
			return "redirect:/tboard/tboarddetail/"+teamboardReplyVO.getBno();
		}else {
			return "err_page";
		}
	}
	@ResponseBody
	@RequestMapping(value = "/modifyReply", method = RequestMethod.POST, produces = "application/json")
	public String modifyReply(@RequestBody String recontent,TeamboardReplyVO teamboardReplyVO, Model model) {
		
		return "a";
		
	}
}
