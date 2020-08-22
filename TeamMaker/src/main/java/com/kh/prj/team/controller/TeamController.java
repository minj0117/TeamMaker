package com.kh.prj.team.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.kh.prj.team.svc.TeamSVC;

@Controller
public class TeamController {
	@Inject
	TeamSVC teamSVC;
	
	
}
