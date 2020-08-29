package com.kh.prj.teamboard.comtroller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.svc.TeamboardSVC;
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
		String result = teamboardSVC.checkmember(teammemberVO);
		if (result == null) {
			String result2 = teamboardSVC.checkowner(tno);
			logger.info("result2 : " + result2);
			logger.info("id : " + id);
			if (result2.equals(id)) {
				teamboardVO = new TeamboardVO();
				List<TeamboardVO> list = teamboardSVC.tboardlist(tno);
				model.addAttribute("list",list);
				return "team/teamboard";
			} else {
				return "err_page";
			}
		} else {
			teamboardVO = new TeamboardVO();
			teamboardVO.setTno(tno);
			List<TeamboardVO> list = new ArrayList<TeamboardVO>();
			list = teamboardSVC.tboardlist(tno);
			model.addAttribute("list",list);
			return "team/teamboard";
		}
	}
	
	@GetMapping("/tboarddetail/{bno}")
	public String tboarddetail(TeamboardVO teamboardVO , Model model) {
		int bno = teamboardVO.getBno();
		logger.info("bno : " + bno);
		teamboardVO = teamboardSVC.tboarddetail(teamboardVO.getBno());
		if(teamboardVO != null) {
			model.addAttribute("teamboardVO",teamboardVO);
			teamboardSVC.tboardcnt(bno);
			return "team/rview";
		}else {
			return "err_page";
		}
	}

	@RequestMapping("writeForm.do")
	public String write() {
		return "team/teamboardForm";
	}

	/**
	 * 게시글 작성
	 * 
	 * @param teamboardVO
	 * @param session
	 */
	// btitle,bcontent,bwriter,tno
	@PostMapping("write.do")
	public String write(@ModelAttribute TeamboardVO teamboardVO, HttpSession session) {
		String bwriter = (String) session.getAttribute("id");
		logger.info("btitle : " + teamboardVO.getBtitle());
		logger.info("btitle : " + teamboardVO.getBcontent());
		logger.info("btitle : " + teamboardVO.getBwriter());
		logger.info("btitle : " + teamboardVO.getTno());
		return null;
	}
}
