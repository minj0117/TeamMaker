package com.kh.prj.recruit.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.prj.recruit.svc.RecruitSVC;
import com.kh.prj.recruit.vo.RecruitVO;

@Controller
public class RecruitController {
	@Inject
	RecruitSVC recruitSVC;
	
	private Logger logger = LoggerFactory.getLogger(RecruitController.class);
	
	/**
	 * 모집글 리스트
	 * @param model
	 * @return
	 */
	@RequestMapping("/rlist")
	public String RecruitList(@ModelAttribute("recruitVO") RecruitVO recruitVO, Model model) {
		logger.info("rlist 들어감");
		List<RecruitVO> rlist = recruitSVC.selectBoardList(recruitVO);
		model.addAttribute("rlist",rlist);
		logger.info("리턴 직전");
		return "recruit/rlist";
	}
	
	@GetMapping("/testForm")
	public String RecruitForm() {
		return "recruit/testForm";
	}
	
	@PostMapping("/insertR")
	public String insertR(RecruitVO recruitVO, Model model) {
		int result = recruitSVC.insertR(recruitVO);
		logger.info("result : " + result);
		List<RecruitVO> rlist = recruitSVC.selectBoardList(recruitVO);
		model.addAttribute("rlist",rlist);
		if(result == 1) {
			return "recruit/rlist";
		}else {
			return "err_page";
		}
	}
	
	@GetMapping("/rview/{rno}")
	public String rview(RecruitVO recruitVO, Model model) {
		recruitVO = recruitSVC.viewR(recruitVO.getRno());
		if(recruitVO != null) {
			recruitSVC.cntR(recruitVO.getRno());
			model.addAttribute("recruitVO", recruitVO);
			System.out.println("컨트롤러 VO : "+ recruitVO);
			System.out.println("컨트롤러 VO(comment) : "+ recruitVO.getRcomment());
			return "recruit/rview";
		}else {
			return "err_page";
		}
	}
	
}
