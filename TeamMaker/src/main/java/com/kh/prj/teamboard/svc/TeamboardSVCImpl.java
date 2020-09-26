package com.kh.prj.teamboard.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.teamboard.dao.TeamboardDAO;
import com.kh.prj.teamboard.vo.FileVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Repository
public class TeamboardSVCImpl implements TeamboardSVC {
	@Inject
	@Qualifier("teamboardDAOImpl")
	TeamboardDAO teamboardDAO;
	
	@Override
	public List<TeamboardVO> boardList(PagingCriteria paging) {
		return teamboardDAO.boardList(paging);
	}
	
	@Override
	public TeamboardVO boardView(int bno) {
		return teamboardDAO.boardView(bno);
	}
	
	@Override
	public int boardWrite(TeamboardVO vo) {
		return teamboardDAO.boardWrite(vo);
	}
	
	@Override
	public int boardDelete(int bno) {
		return teamboardDAO.boardDelete(bno);
	}
	
	@Override
	public int boardMod(TeamboardVO vo) {
		return teamboardDAO.boardMod(vo);
	}
	
	@Override
	public int boardReply(TeamboardVO vo) {
		return teamboardDAO.boardReply(vo);
	}
	@Override
	public int fileupload(FileVO fvo) {
		return teamboardDAO.fileupload(fvo);
	}
	
	@Override
	public List<FileVO> fileList(PagingCriteria paging) {
		return teamboardDAO.fileList(paging);
	}
	
	@Override
	public FileVO fileView(int bno) {
		return teamboardDAO.fileView(bno);
	}
	
	@Override
	public int fileMod(FileVO fvo) {
		return teamboardDAO.fileMod(fvo);
	}
	
	@Override
	public int fileDelete(int bno) {
		return teamboardDAO.fileDelete(bno);
	}
	
	@Override
	public int totalCnt(int tno) {
		return teamboardDAO.totalCnt(tno);
	}
	@Override
	public int totalCntboard(int tno) {
		return teamboardDAO.totalCntboard(tno);
	}
}
