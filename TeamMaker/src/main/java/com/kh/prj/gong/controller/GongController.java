package com.kh.prj.gong.controller;

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

import com.kh.prj.gong.svc.GongSVC;
import com.kh.prj.gong.vo.GongVO;

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
   @ResponseBody
   @RequestMapping(value="/insertGong", method= RequestMethod.POST, produces="application/json")
   public int insertGong(@RequestBody HashMap<String, String> info, GongVO gongVO) throws Exception {
      java.sql.Date applystart = java.sql.Date.valueOf(info.get("applystart"));
    java.sql.Date applyend = java.sql.Date.valueOf(info.get("applyend"));
    java.sql.Date startday = java.sql.Date.valueOf(info.get("startday"));
    byte[] pic = info.get("pic").getBytes();
    gongVO.setWriter(info.get("writer"));
    gongVO.setCategory(info.get("category"));
    gongVO.setTitle(info.get("title"));
    gongVO.setApplystart(applystart);
    gongVO.setApplyend(applyend);
    gongVO.setStartday(startday);
    gongVO.setHost(info.get("host"));
    gongVO.setWay(info.get("way"));
    gongVO.setHomepage(info.get("homepage"));
    gongVO.setG_comment(info.get("g_comment"));
    gongVO.setPic(pic);
    gongVO.setApplymoney(info.get("applymoney"));
    gongVO.setAward(info.get("award"));
      return gongSVC.insertGong(gongVO);
   }
   
   @RequestMapping("/glist")
   public String glist(GongVO gongVO, Model model) {
      List<GongVO> list = gongSVC.glist();
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
   
   @ResponseBody
   @RequestMapping(value = "gongMod", method= RequestMethod.POST, produces="application/json")
   public int gongMod(@RequestBody HashMap<String, String> info, GongVO gongVO) {
    java.sql.Date applystart = java.sql.Date.valueOf(info.get("applystart"));
    java.sql.Date applyend = java.sql.Date.valueOf(info.get("applyend"));
    java.sql.Date startday = java.sql.Date.valueOf(info.get("startday"));
    byte[] pic = info.get("pic").getBytes();
    gongVO.setGno(Integer.parseInt(info.get("gno")));
    gongVO.setCategory(info.get("category"));
    gongVO.setTitle(info.get("title"));
    gongVO.setApplystart(applystart);
    gongVO.setApplyend(applyend);
    gongVO.setStartday(startday);
    gongVO.setHost(info.get("host"));
    gongVO.setWay(info.get("way"));
    gongVO.setHomepage(info.get("homepage"));
    gongVO.setG_comment(info.get("g_comment"));
    gongVO.setPic(pic);
    gongVO.setApplymoney(info.get("applymoney"));
    gongVO.setAward(info.get("award"));
    return gongSVC.GongMod(gongVO);
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
   
}
