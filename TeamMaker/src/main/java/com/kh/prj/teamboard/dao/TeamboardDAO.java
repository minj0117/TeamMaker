package com.kh.prj.teamboard.dao;

import java.util.List;

import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.vo.FileVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

public interface TeamboardDAO {
	public List<TeamboardVO> boardList(PagingCriteria paging);
	
	public TeamboardVO boardView(int bno);
	
	public int boardWrite(TeamboardVO vo);
	
	public int boardDelete(int bno);
	
	public int boardMod(TeamboardVO vo);
	
	public int boardReply(TeamboardVO vo);
	
	public int fileupload(FileVO fvo);
	
	public List<FileVO> fileList(PagingCriteria paging);
	
	public FileVO fileView(int bno);
	
	public int fileMod(FileVO fvo);
	
	public int fileDelete(int bno);
	
	public int totalCnt(int tno);
	public int totalCntboard(int tno);

}
