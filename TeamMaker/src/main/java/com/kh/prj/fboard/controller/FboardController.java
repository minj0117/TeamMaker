package com.kh.prj.fboard.controller;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.prj.fboard.svc.FboardSVC;
import com.kh.prj.fboard.vo.FboardVO;

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
}
