package com.kh.prj.teamboard.dao;

import java.util.List;

import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.vo.TeamboardReplyVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

public interface TeamboardDAO {
	public TeammemberVO checkmember(TeammemberVO teammemberVO);
	public String checkowner(int tno);
	public List<TeamboardVO> tboardlist(int tno);
	public TeamboardVO tboarddetail(int bno);
	public int tboardcnt(int bno);
	public int write(TeamboardVO teamboardVO);
	
	
	public List<TeamboardReplyVO> showreply(int bno);
	public int writeReply(TeamboardReplyVO teamboardReplyVO);
}
