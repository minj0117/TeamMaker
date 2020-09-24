package com.kh.prj.dae.controller;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.prj.dae.svc.DaeSVC;
import com.kh.prj.dae.vo.DaeVO;
import com.kh.prj.paging.PageMaker;
import com.kh.prj.paging.PagingCriteria;

@Controller
@RequestMapping("/dae/*")
public class DaeController {
	@Inject
	DaeSVC daeSVC;

	private Logger logger = LoggerFactory.getLogger("DaeController.class");

	/**
	 * 대외활동 작성폼
	 * 
	 * @return
	 */
	@RequestMapping("daeForm")
	public String daeForm(Model model) {
		model.addAttribute("toggle", 1);
		return "dae/daeForm";
	}

	/**
	 * 대외활동 작성 처리
	 * 
	 * @param info
	 * @param daeVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/insertDae")
	public String insertDae(DaeVO daeVO) throws Exception {
		String fileName=null;
		MultipartFile uploadFile = daeVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("D:\\file\\dae\\" + fileName));
		}
		daeVO.setFileName(fileName);
		daeSVC.insertDae(daeVO);
		return "redirect:dlist";
	}

	@RequestMapping("/dlist")
	public String dlist(DaeVO daeVO,PagingCriteria cri, Model model) {
		List<DaeVO> list = daeSVC.dlist(cri);
		int total = daeSVC.getTotalCnt();
		model.addAttribute("paging",new PageMaker(cri,total));
		model.addAttribute("list", list);
		return "dae/dlist";
	}

	@GetMapping("/dview/{dno}")
	public String dview(@PathVariable("dno") int dno, DaeVO daeVO, Model model) {
		daeVO = daeSVC.dview(dno);
		model.addAttribute("daeVO", daeVO);
		return "dae/dview";
	}

	/**
	 * 수정
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/daeModForm/{dno}")
	public String daeModForm(@PathVariable("dno") int dno, DaeVO daeVO, Model model) {
		daeVO = daeSVC.dview(dno);
		model.addAttribute("toggle", 2);
		model.addAttribute("daeVO", daeVO);
		return "dae/daeForm";
	}

	@PostMapping("/daeMod")
	public String daeMod(DaeVO daeVO) throws Exception {
		String fileName=null;
		MultipartFile uploadFile = daeVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("D:\\file\\dae\\" + fileName));
		}
		daeVO.setFileName(fileName);
		int cnt = daeSVC.DaeMod(daeVO);
		return "redirect:dlist";
	}

	/*
	 * @GetMapping("/del/{dno}") public int del(@PathVariable("dno") int dno,DaeVO
	 * daeVO) { return daeSVC.del(dno); }
	 */
	@ResponseBody
	@RequestMapping(value = "del", method = RequestMethod.POST, produces = "application/json")
	public int del(@RequestBody HashMap<String, String> info, DaeVO daeVO) {
		int dno = Integer.parseInt(info.get("dno"));
		return daeSVC.del(dno);
	}

	@RequestMapping(value = "/checklist", method = RequestMethod.GET)
	public String checklist(@RequestParam("d1") List<String> value, Model model) {
		List<DaeVO> list = daeSVC.checklist(value);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getTitle().toString());
		}
		model.addAttribute("list", list);
		return "dae/dlist";
	}

}
