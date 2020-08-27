package com.kh.prj.apply.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.prj.apply.svc.ApplySVC;
import com.kh.prj.apply.vo.ApplyVO;



@Controller
public class ApplyController {
	private Logger logger = LoggerFactory.getLogger(ApplyController.class);

	@Inject
	ApplySVC applySVC;
	
	@GetMapping("/addapply")
	public String addapply(ApplyVO applyVO) {
		logger.info("tno : " + applyVO.getTno() );
		logger.info("applyid : " + applyVO.getApplyid() );
		int result = applySVC.check(applyVO);
		if(result == 0) {
			int result2 = applySVC.addlist(applyVO);
			if(result2 != 0) {
				return "team/list";
			}else {
				return "err_page";
			}
		}else {
			System.out.println("이미 신청했습니다.");
			return "err_page";
		}
	}
}
