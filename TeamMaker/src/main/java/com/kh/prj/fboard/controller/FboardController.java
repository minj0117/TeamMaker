package com.kh.prj.fboard.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.fboard.svc.FboardSVC;
import com.kh.prj.fboard.vo.FboardVO;
import com.kh.prj.member.vo.MemberVO;
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
		vo = fboardSVC.view(fno);
		List<FboardVO> list = fboardSVC.viewReply(fno); //리플가져오기
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		return "fboard/fboardView";
	}
	
	@ResponseBody
	@RequestMapping(value="/pwcheck", method = RequestMethod.POST, produces = "application/json")
	public int pwCheck(@RequestBody HashMap<String, String> info, FboardVO vo) {
		vo.setFno(Integer.parseInt(info.get("fno")));
		vo.setPw(info.get("pw"));
		System.out.println("들어옴");
		return fboardSVC.pwCheck(vo);
	}
	
	@GetMapping("/fboardModForm")
	public String fboardModForm(@RequestParam("fno") int fno , Model model) {
		FboardVO vo = fboardSVC.view(fno);
		model.addAttribute("vo",vo);
		return "fboard/fboardModForm";
	}
	
	// @RequestParam : url로  파라미터 넘기기
	// @PathVariable : url경로에 변수 넣기 -> restful api    // 차이 잊지말기!!
	// rest api는 url 소문자로 설정하자! RFC 뜬다!
	
	@ResponseBody
	@RequestMapping(value="/fboardmod", method=RequestMethod.PUT, produces = "application/json")
	public int fboardMod(@RequestBody HashMap<String, String> info, FboardVO vo) {
		vo.setPw(info.get("pw"));
		vo.setTitle(info.get("title"));
		vo.setF_comment(info.get("f_comment"));
		vo.setFno(Integer.parseInt(info.get("fno")));
		return fboardSVC.fboardMod(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/fboarddel", method=RequestMethod.DELETE, produces = "application/json")
	public int fboardDel(@RequestBody HashMap<String, String> info, FboardVO vo) {
		vo.setFno(Integer.parseInt(info.get("fno")));
		vo.setPw(info.get("pw"));
		return fboardSVC.fboardDel(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/replyinsert", method=RequestMethod.POST, produces = "application/json")
	public int replyinsert(@RequestBody HashMap<String, String> info, FboardVO vo, HttpSession session) {
		String writer = ((MemberVO) session.getAttribute("member")).getId();
		System.out.println(writer);
		vo.setWriter(writer);
		vo.setFno(Integer.parseInt(info.get("fno")));
		vo.setF_comment(info.get("f_comment"));
		System.out.println(vo.getF_comment());
		return fboardSVC.replyinsert(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/replydelete", method=RequestMethod.DELETE, produces = "application/json")
	public int replydelete(@RequestBody HashMap<String, String> info) {
		return fboardSVC.replydelete(Integer.parseInt(info.get("fno")));
	}
	
}
