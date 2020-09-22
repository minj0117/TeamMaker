package com.kh.prj.teamboard.comtroller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.teamboard.svc.TeamboardSVC;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Controller
@RequestMapping("/tboard/*")
public class TeamboardController {
	private Logger logger = LoggerFactory.getLogger(TeamboardController.class);
	@Inject
	TeamboardSVC teamboardSVC;
	
	@GetMapping("/boardList")
	public String boardList(@RequestParam("tno") int tno,Model model,  PagingCriteria cri){
		List<TeamboardVO> list = teamboardSVC.boardList(tno);
		model.addAttribute("list", list);
		model.addAttribute("tno", tno);
		//model.addAttribute("tno",list.get(0).getTno());
		return "team/teamboard";
	}
	
	@GetMapping("/boardView/{bno}")
	public String boardView(@RequestParam("bno") int bno,Model model) {
		System.out.println("들어옴");
		System.out.println(bno);
		TeamboardVO vo = teamboardSVC.boardView(bno);
		model.addAttribute("vo",vo);
		return "team/rview";
	}
	
	@GetMapping("/boardForm")
	public String boardForm(@RequestParam("tno") int tno, Model model) {
		model.addAttribute("tno",tno);
		return "team/teamboardForm";
	}
	/**
	 * 글쓰기
	 * @param info
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/boardWrite", method = RequestMethod.POST, produces = "application/json")
	public int boardWrite(@RequestBody HashMap<String, String> info) throws Exception {
		TeamboardVO vo = new TeamboardVO();
		vo.setTitle(info.get("title"));
		vo.setB_comment(info.get("b_comment"));
		vo.setWriter(info.get("writer"));
		vo.setTno(Integer.parseInt(info.get("tno")));
		return teamboardSVC.boardWrite(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/boardDelete", method = RequestMethod.DELETE, produces = "application/json")
	public int boardDelete(@RequestBody HashMap<String, String> info) throws Exception {
		int bno = Integer.parseInt(info.get("bno"));
		return teamboardSVC.boardDelete(bno);
	}
	
	@GetMapping("/boardModForm")
	public String boardModForm(@RequestParam("bno") int bno,Model model,TeamboardVO vo) {
		vo = teamboardSVC.boardView(bno);
		model.addAttribute("vo",vo);
		return "team/teamboardModForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/boardMod", method = RequestMethod.PUT, produces = "application/json")
	public int boardMod(@RequestBody HashMap<String, String> info, TeamboardVO vo) throws Exception {
		vo.setTitle(info.get("title"));
		vo.setB_comment(info.get("b_comment"));
		vo.setBno(Integer.parseInt(info.get("bno")));
		return teamboardSVC.boardMod(vo);
	}
}
