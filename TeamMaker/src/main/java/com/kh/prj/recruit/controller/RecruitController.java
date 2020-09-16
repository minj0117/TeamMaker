package com.kh.prj.recruit.controller;

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

import com.kh.prj.paging.PageMaker;
import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.recruit.svc.RecruitSVC;
import com.kh.prj.recruit.vo.RecruitVO;
import com.kh.prj.team.svc.TeamSVC;
import com.kh.prj.team.vo.TeamVO;

@Controller
public class RecruitController {
	@Inject
	RecruitSVC recruitSVC;
	@Inject
	TeamSVC teamSVC;
	
	private Logger logger = LoggerFactory.getLogger(RecruitController.class);
	
	/**
	 * 모집글 리스트
	 * @param model
	 * @return
	 */
	@RequestMapping("/rlist.do")
	public String RecruitList(@ModelAttribute("recruitVO") RecruitVO recruitVO,PagingCriteria cri, Model model) {
		List<RecruitVO> rlist = recruitSVC.selectBoardList(cri);
		int total = recruitSVC.totalCnt();
		model.addAttribute("rlist",rlist);
		model.addAttribute("paging",new PageMaker(cri,total));
		for(int i=0; i<rlist.size(); i++) {
			System.out.println(rlist.get(i).getRtitle());
		}
		return "recruit/rlist";
	}
	
	/**
	 * 임시 모집글
	 * @return
	 */
	@GetMapping("/recruitForm")
	public String RecruitForm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		List<TeamVO> list = teamSVC.myList(id);
		model.addAttribute("list", list);
		return "recruit/recruitForm";
	}
	
	/**
	 * 모집글 등록
	 * @param recruitVO
	 * @param model
	 * @return
	 */
	@PostMapping("/insertR")
	public String insertR(RecruitVO recruitVO, Model model) {
		int result = recruitSVC.insertR(recruitVO);
		logger.info("result : " + result);
		List<RecruitVO> rlist = recruitSVC.BoardList(recruitVO);
		logger.info(" : "+recruitVO);
		model.addAttribute("rlist",rlist);
		return "recruit/rlist";
		/*if(result == 1) {
			int result2 = recruitSVC.addList(recruitVO);
			if(result2 == 1) {
				return "recruit/rlist";
			}else{
				return "err_page";
			}
		}else {
			return "err_page";
		}*/
	}
	
	/**
	 * 모집글 상세 조회
	 * @param recruitVO
	 * @param model
	 * @return
	 */
	@GetMapping("/rview/{rno}")
	public String rview(RecruitVO recruitVO, Model model) {
		recruitVO = recruitSVC.viewR(recruitVO.getRno());
		if(recruitVO != null) {
			recruitSVC.cntR(recruitVO.getRno());
			model.addAttribute("recruitVO", recruitVO);
			return "recruit/rview";
		}else {
			return "err_page";
		}
	}
	
	
	@RequestMapping("/apply")
	public String apply(String id) {
		
		return null;
	}
	
}
