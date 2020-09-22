package com.kh.prj.teamboard.dao;

import java.util.List;

import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.vo.TeamboardReplyVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

public interface TeamboardDAO {
	public List<TeamboardVO> boardList(int tno);
	
	public TeamboardVO boardView(int bno);
	
	public int boardWrite(TeamboardVO vo);
	
	public int boardDelete(int bno);
	
	public int boardMod(TeamboardVO vo);
}
