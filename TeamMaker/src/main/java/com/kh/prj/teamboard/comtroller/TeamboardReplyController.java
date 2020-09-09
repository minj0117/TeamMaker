package com.kh.prj.teamboard.comtroller;

import java.util.HashMap;

import javax.inject.Inject;

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

import com.kh.prj.teamboard.svc.TeamboardSVC;
import com.kh.prj.teamboard.vo.TeamboardReplyVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

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
	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST, produces = "application/json")
	public int deleteReply(@RequestBody HashMap<String, String> num) throws Exception {
		int rno = Integer.parseInt(num.get("rno"));
		logger.info("rno : " + rno);
		int result = teamboardSVC.deleteReply(rno);
		return result;
	}
	
	
	@GetMapping("/replymodForm.do")
	public String modForm(@RequestParam("rno") int rno, Model model) {
		TeamboardReplyVO teamboardReplyVO = teamboardSVC.detailReply(rno);
		model.addAttribute("view",teamboardReplyVO);
		return "team/replymod";
	}
	
	@ResponseBody
	@RequestMapping(value = "/replymod", method = RequestMethod.POST, produces = "application/json")
	public int modForm(@RequestBody HashMap<String, String> info) throws Exception {
		TeamboardReplyVO teamboardReplyVO = new TeamboardReplyVO();
		teamboardReplyVO.setRno(Integer.parseInt(info.get("rno")));
		teamboardReplyVO.setRcontent(info.get("rcontent"));
		int result = teamboardSVC.modifyReply(teamboardReplyVO);
		return result;
	}
	
	@GetMapping("rereplyForm.do")
	public String rereplyForm(@RequestParam("rno") int rno, Model model) {
		TeamboardReplyVO teamboardReplyVO = teamboardSVC.detailReply(rno);
		model.addAttribute("view",teamboardReplyVO);
		return "team/rereplyForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/rereply", method = RequestMethod.POST, produces = "application/json")
	public int rereply(@RequestBody HashMap<String, String> info) throws Exception {
		TeamboardReplyVO teamboardReplyVO = new TeamboardReplyVO();
		teamboardReplyVO.setRwriter(info.get("rwriter"));
		teamboardReplyVO.setRcontent("	Re : " + info.get("rcontent"));
		teamboardReplyVO.setRlevel(Integer.parseInt(info.get("rlevel"))+1);
		teamboardReplyVO.setRpw(info.get("rpw"));
		teamboardReplyVO.setBno(Integer.parseInt(info.get("bno")));
		teamboardReplyVO.setRgroup(Integer.parseInt(info.get("rgroup")));
		int result = teamboardSVC.rereply(teamboardReplyVO);
		return result;
	}
	
	//대댓글
}
