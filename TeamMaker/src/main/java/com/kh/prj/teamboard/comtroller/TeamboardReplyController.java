package com.kh.prj.teamboard.comtroller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.prj.teamboard.svc.TeamboardSVC;
import com.kh.prj.teamboard.vo.TeamboardReplyVO;

@Controller
public class TeamboardReplyController {
	@Inject
	TeamboardSVC teamboardSVC;
	
	@PostMapping("/writeReply")
	public String writeReply(TeamboardReplyVO teamboardReplyVO, Model model) {
		int result = teamboardSVC.writeReply(teamboardReplyVO);
		if(result != 0) {
			return "redirect:/tboard/tboarddetail/"+teamboardReplyVO.getBno();
		}else {
			return "err_page";
		}
	}
}
