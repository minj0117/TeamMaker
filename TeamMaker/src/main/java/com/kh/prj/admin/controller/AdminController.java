package com.kh.prj.admin.controller;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.prj.admin.svc.AdminSVC;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Inject
	AdminSVC adminSVC;
	
	@Inject
	private SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	
}