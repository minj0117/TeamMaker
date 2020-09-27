package com.kh.prj.common;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kh.prj.team.svc.TeamSVC;
import com.kh.prj.team.vo.TeammemberVO;

@Service
public class authSVC {
	@Inject
	TeamSVC teamSVC;
	
	public int auth(String id,  int tno) {
		TeammemberVO vo = new TeammemberVO();
		vo.setUserid(id);
		vo.setTno(tno);
		return teamSVC.checkmember(vo);
	}
	
	public String ownercheck(int tno) {
		return teamSVC.checkowner(tno);
	}
}
