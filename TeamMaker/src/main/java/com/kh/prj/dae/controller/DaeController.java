package com.kh.prj.dae.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.dae.svc.DaeSVC;
import com.kh.prj.dae.vo.DaeVO;

@Controller
@RequestMapping("/dae/*")
public class DaeController {
	@Inject
	DaeSVC daeSVC;

	private Logger logger = LoggerFactory.getLogger("DaeController.class");
	/**
	 * 대외활동 작성폼
	 * @return
	 */
	@RequestMapping("daeForm")
	public String daeForm(Model model) {
		model.addAttribute("toggle",1);
		return "dae/daeForm";
	}
	/**
	 * 대외활동 작성 처리
	 * @param info
	 * @param daeVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertDae", method = RequestMethod.POST, produces = "application/json")
	public int insertDae(@RequestBody HashMap<String,String> info, DaeVO daeVO) throws Exception {
		java.sql.Date applystart = java.sql.Date.valueOf(info.get("applystart"));
		java.sql.Date applyend = java.sql.Date.valueOf(info.get("applyend"));
		java.sql.Date startday = java.sql.Date.valueOf(info.get("startday"));
		byte[] pic = info.get("pic").getBytes();
		daeVO.setWriter(info.get("writer"));
		daeVO.setCategory(info.get("category"));
		daeVO.setTitle(info.get("title"));
		daeVO.setApplystart(applystart);
		daeVO.setApplyend(applyend);
		daeVO.setStartday(startday);
		daeVO.setHost(info.get("host"));
		daeVO.setWay(info.get("way"));
		daeVO.setHomepage(info.get("homepage"));
		daeVO.setD_comment(info.get("d_comment"));
		daeVO.setPic(pic);
		daeVO.setApplymoney(info.get("applymoney"));
		daeVO.setAward(info.get("award"));
		return daeSVC.insertDae(daeVO);
	}
	
	@RequestMapping("/dlist")
	public String dlist(DaeVO daeVO,Model model) {
		InputStream is = null;
		List<DaeVO> list = daeSVC.dlist();
		model.addAttribute("list",list);
		return "dae/dlist";
	}
	
	@GetMapping("/dview/{dno}")
	public String dview(@PathVariable("dno") int dno, DaeVO daeVO, Model model) {
		daeVO = daeSVC.dview(dno);
		model.addAttribute("daeVO",daeVO);
		return "dae/dview";
	}
	
	/**
	 * 수정 
	 * @param model
	 * @return
	 */
	@GetMapping("/daeModForm/{dno}")
	public String daeModForm(@PathVariable("dno") int dno,DaeVO daeVO, Model model) {
		daeVO = daeSVC.dview(dno);
		model.addAttribute("toggle",2);
		model.addAttribute("daeVO",daeVO);
		return "dae/daeForm";
	}
	
	@ResponseBody
	@RequestMapping(value="daeMod",  method = RequestMethod.POST, produces = "application/json")
	public int daeMod(@RequestBody HashMap<String,String> info, DaeVO daeVO) throws Exception {
		java.sql.Date applystart = java.sql.Date.valueOf(info.get("applystart"));
		java.sql.Date applyend = java.sql.Date.valueOf(info.get("applyend"));
		java.sql.Date startday = java.sql.Date.valueOf(info.get("startday"));
		byte[] pic = info.get("pic").getBytes();
		daeVO.setDno(Integer.parseInt(info.get("dno")));
		daeVO.setCategory(info.get("category"));
		daeVO.setTitle(info.get("title"));
		daeVO.setApplystart(applystart);
		daeVO.setApplyend(applyend);
		daeVO.setStartday(startday);
		daeVO.setHost(info.get("host"));
		daeVO.setWay(info.get("way"));
		daeVO.setHomepage(info.get("homepage"));
		daeVO.setD_comment(info.get("d_comment"));
		daeVO.setPic(pic);
		daeVO.setApplymoney(info.get("applymoney"));
		daeVO.setAward(info.get("award"));
		int cnt = daeSVC.DaeMod(daeVO);
		return cnt;
	}
	
	/*@GetMapping("/del/{dno}")
	public int del(@PathVariable("dno") int dno,DaeVO daeVO) {
		return daeSVC.del(dno);
	}*/
	@ResponseBody
	@RequestMapping(value="del",  method = RequestMethod.POST, produces = "application/json")
	public int del(@RequestBody HashMap<String, String> info,DaeVO daeVO) {
		int dno = Integer.parseInt(info.get("dno"));
		return daeSVC.del(dno);
	}
	
}
