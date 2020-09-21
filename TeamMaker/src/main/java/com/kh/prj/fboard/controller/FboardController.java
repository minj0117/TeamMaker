package com.kh.prj.fboard.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.dae.vo.DaeVO;
import com.kh.prj.fboard.svc.FboardSVC;
import com.kh.prj.fboard.vo.FboardVO;
import com.kh.prj.paging.PageMaker;
import com.kh.prj.paging.PagingCriteria;

@Controller
@RequestMapping("/fboard/*")
public class FboardController {
	@Inject
	FboardSVC fboardSVC;
	
	@RequestMapping("/fboardForm")
	public String fboardForm() {
		return "fboard/fboardForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST, produces = "application/json")
	public int write(@RequestBody HashMap<String,String> info, FboardVO vo) {
		vo.setWriter(info.get("writer"));
		vo.setPw(info.get("pw"));
		vo.setTitle(info.get("title"));
		vo.setF_comment(info.get("f_comment"));
		return fboardSVC.write(vo);
	}
	
	@RequestMapping("/fboardList")
	public String fboardList(Model model,PagingCriteria cri) {
		List<FboardVO> list = fboardSVC.fboardList(cri);
		int total = fboardSVC.totalCnt();
		System.out.println("total : " + total);
		model.addAttribute("paging",new PageMaker(cri,total));
		model.addAttribute("list",list);
		return "fboard/fboardList";
	}
	
	@GetMapping("/fboardView/{fno}")
	public String dview(@PathVariable("fno") int fno,FboardVO vo,Model model) {
		List<FboardVO> list = null;
		System.out.println("dno : " + fno);
		vo = fboardSVC.view(fno);
		list = fboardSVC.viewReply(vo.getFgroup());
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		return "fboard/fboardView";
		
	}
}
