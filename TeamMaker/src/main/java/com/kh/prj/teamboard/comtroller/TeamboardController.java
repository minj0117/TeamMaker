package com.kh.prj.teamboard.comtroller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.prj.teamboard.svc.TeamboardSVC;
import com.kh.prj.teamboard.vo.TeamboardVO;

@RestController
@RequestMapping("/tboard/*")
public class TeamboardController {
	private Logger logger = LoggerFactory.getLogger(TeamboardController.class);
	@Inject
	TeamboardSVC teamboardSVC;
	
	/**
	 * 게시글 작성
	 * @param teamboardVO
	 * @param session
	 */
	@RequestMapping("write.do")
	public TeamboardVO write(@ModelAttribute TeamboardVO teamboardVO, HttpSession session) {
		String bwriter = (String)session.getAttribute("id");
		teamboardVO.setBwriter(bwriter);
		//teamboardSVC.write(teamboardVO);
		return teamboardVO;
	}
}
