package com.kh.prj.gong.controller;

import java.io.File;
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

import com.kh.prj.dae.vo.DaeVO;
import com.kh.prj.gong.svc.GongSVC;
import com.kh.prj.gong.vo.GongVO;
import com.kh.prj.paging.PageMaker;
import com.kh.prj.paging.PagingCriteria;

@Controller
@RequestMapping("/gong/*")
public class GongController {
   @Inject
   GongSVC gongSVC;
   
   private Logger logger = LoggerFactory.getLogger(GongController.class);
   
   @RequestMapping("gongForm")
   public String gongForm(Model model) {
	  model.addAttribute("toggle",1);
      return "gong/gongForm";
   }
   
   
   /**
    * 공모전 작성 처리
    * @param info
    * @param gongVO
    * @return
    * @throws Exception
    */
   @PostMapping("/insertGong")
   public String insertGong(GongVO gongVO) throws Exception {
	   String fileName=null;
		MultipartFile uploadFile = gongVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("D:\\file\\gong\\" + fileName));
		}
		gongVO.setFileName(fileName);
        int result = gongSVC.insertGong(gongVO);
		return "redirect:glist";
   }
   
   @RequestMapping("/glist")
   public String glist(GongVO gongVO,PagingCriteria cri, Model model) {
      List<GongVO> list = gongSVC.glist(cri);
      int total = gongSVC.getTotalCnt();
      model.addAttribute("paging",new PageMaker(cri,total));
      model.addAttribute("list", list);
      return "gong/glist";
   }
   
   @GetMapping("/gview/{gno}")
   public String gview(@PathVariable("gno") int gno, GongVO gongVO, Model model) {
      gongVO = gongSVC.gview(gno);
      model.addAttribute("gongVO", gongVO);
      return "gong/gview";
   }
   
   /**
    * 수정
    * @param model
    * return    
    */
   @GetMapping("/gongModForm/{gno}")
   public String gongModForm(@PathVariable("gno") int gno, GongVO gongVO, Model model) {
      gongVO = gongSVC.gview(gno);
      model.addAttribute("toggle",2);
      model.addAttribute("gongVO", gongVO);
      return "gong/gongForm";
   }
   
   @PostMapping("/gongMod")
   public String gongMod(GongVO gongVO) throws Exception {
	   String fileName=null;
		MultipartFile uploadFile = gongVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("D:\\file\\gong\\" + fileName));
		}
		gongVO.setFileName(fileName);
		int cnt = gongSVC.GongMod(gongVO);
		return "redirect:glist";
   }
   
//   /*
//    * @GetMapping("/del/{gno}") public int del(@PathVariable("gno") int gno, GongVO
//    * gongVO) { return gongSVC.del(gno); }
//    */
   
   @ResponseBody
   @RequestMapping(value="del", method=RequestMethod.POST, produces="application/json")
   public int del(@RequestBody HashMap<String, String> info, GongVO gongVO) {
      int gno = Integer.parseInt(info.get("gno"));
      return gongSVC.del(gno);
   }
   
   
   @RequestMapping(value = "/checklist", method = RequestMethod.GET)
	public String checklist(@RequestParam("g1") List<String> value, Model model) {
		List<GongVO> list = gongSVC.checklist(value);
		model.addAttribute("list", list);
		return "gong/glist";
	}
   
}
