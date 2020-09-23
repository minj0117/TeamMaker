package com.kh.prj.teamboard.svc;

import java.util.List;

import com.kh.prj.teamboard.vo.FileVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

public interface TeamboardSVC {
	public List<TeamboardVO> boardList(int tno);
	
	public TeamboardVO boardView(int bno);
	
	public int boardWrite(TeamboardVO vo);
	
	public int boardDelete(int bno);
	
	public int boardMod(TeamboardVO vo);
	
	public int boardReply(TeamboardVO vo);
	
	public int fileupload(FileVO fvo);
	
	public List<FileVO> fileList(int tno);
	
	public FileVO fileView(int bno);
	
	public int fileMod(FileVO fvo);
	
	public int fileDelete(int bno);
	
	public int totalCnt();
}
