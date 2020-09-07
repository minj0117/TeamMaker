package com.kh.prj.teamboard.comtroller;

import java.util.HashMap;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	private Logger logger = LoggerFactory.getLogger(TeamboardReplyController.class);
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
		return "null";
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST, produces = "application/json")
	public int deleteReply(@RequestBody HashMap<String, String> num) throws Exception {
		int rno = Integer.parseInt(num.get("rno"));
		logger.info("rno : " + rno);
		int result = teamboardSVC.deleteReply(rno);
		return result;
	}
	
	@RequestMapping("/modForm")
	public String modForm() {
		return "team/replymod";
	}
}
