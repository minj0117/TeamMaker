package com.kh.prj.teamboard.comtroller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.svc.TeamboardSVC;
import com.kh.prj.teamboard.vo.TeamboardReplyVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Controller
@RequestMapping("/tboard/*")
public class TeamboardController {
	private Logger logger = LoggerFactory.getLogger(TeamboardController.class);
	@Inject
	TeamboardSVC teamboardSVC;
	
	/**
	 * 팀 게시글 조회
	 * @param session
	 * @param teammemberVO
	 * @param model
	 * @return
	 */
	@GetMapping("/tboardlist/{tno}")
	public String tboardList(HttpSession session, TeammemberVO teammemberVO, Model model) {
		TeamboardVO teamboardVO = null;
		String id = (String) session.getAttribute("id");
		int tno = teammemberVO.getTno();
		teammemberVO.setUserid(id);
		teammemberVO.setTno(tno);
		teammemberVO = teamboardSVC.checkmember(teammemberVO);
		if (teammemberVO == null) {
			String result2 = teamboardSVC.checkowner(tno);
			if (result2.equals(id)) {
				teamboardVO = new TeamboardVO();
				List<TeamboardVO> list = teamboardSVC.tboardlist(tno);
				model.addAttribute("list",list);
				model.addAttribute("tno",tno);
				return "team/teamboard";
			} else {
				return "err_page";
			}
		} else {
			teamboardVO = new TeamboardVO();
			teamboardVO.setTno(tno);
			List<TeamboardVO> list = teamboardSVC.tboardlist(tno);
			model.addAttribute("list",list);
			model.addAttribute("tno",tno);
			return "team/teamboard";
		}
	}
	
	@GetMapping("/tboarddetail/{bno}")
	public String tboarddetail(TeamboardVO teamboardVO ,TeamboardReplyVO teamboardReplyVO , Model model) {
		int bno = teamboardVO.getBno();
		teamboardVO = teamboardSVC.tboarddetail(teamboardVO.getBno());
		if(teamboardVO != null) {
			teamboardVO.setBno(bno);
			List<TeamboardReplyVO> list =  teamboardSVC.showreply(bno); //댓글리스트
			int rgroup = list.get(0).getRgroup();
			logger.info("rgroup : " + rgroup);
			List<TeamboardReplyVO> relist = teamboardSVC.showrereply(rgroup);
			//System.out.println("bno : " + teamboardVO.getBno());
			model.addAttribute("teamboardVO",teamboardVO);
			model.addAttribute("reply",list);
			model.addAttribute("rereply", relist);
			teamboardSVC.tboardcnt(bno);
			return "team/rview";
		}else {
			return "err_page";
		}
	}

	@RequestMapping("/writeForm.do")
	public String write(HttpServletRequest request, Model model) {
		int tno = Integer.parseInt(request.getParameter("tno"));
		model.addAttribute("tno",tno);
		return "team/teamboardForm";
		
	}

	/**
	 * 게시글 작성
	 * 
	 * @param teamboardVO
	 * @param session
	 */
	@PostMapping("/write.do")
	public String write(TeamboardVO teamboardVO, HttpSession session, HttpServletRequest request) {
		logger.info("들어옴");
		String bwriter = (String) session.getAttribute("id");
		int tno = Integer.parseInt(request.getParameter("tno"));
		teamboardVO.setTno(tno);
		int result = teamboardSVC.write(teamboardVO);
		if(result != 0) {
			return "redirect:/tboard/tboardlist/"+tno;
		}else {
			return "err_page";
		}
	}
	
	/**
	 * 게시글 삭제
	 * @param num
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST, produces = "application/json")
	public int delete(@RequestBody HashMap<String, String> num) throws Exception{
		int bno = Integer.parseInt(num.get("bno"));
		int result = teamboardSVC.delete(bno);
		return result;
	}
	
	/**
	 * 게시글 수정 폼
	 * @param bno
	 * @param model
	 * @return
	 */
	@GetMapping("/modForm.do")
	public String modForm(@RequestParam("bno") int bno, Model model) {
		TeamboardVO teamboardVO = teamboardSVC.tboarddetail(bno);
		model.addAttribute("view",teamboardVO);
		return "team/modForm";
	}
	/**
	 * 게시글 수정 처리
	 * @param info
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST, produces = "application/json")
	public int modify(@RequestBody HashMap<String, String> info) throws Exception {
		int bno = Integer.parseInt(info.get("bno"));
		String btitle = info.get("btitle");
		String bcontent = info.get("bcontent");
		TeamboardVO teamboardVO = new TeamboardVO();
		teamboardVO.setBno(bno);
		teamboardVO.setBtitle(btitle);
		teamboardVO.setBcontent(bcontent);
		int result = teamboardSVC.modify(teamboardVO);
		return result;
	}
}
