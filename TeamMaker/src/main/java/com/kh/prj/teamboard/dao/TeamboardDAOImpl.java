package com.kh.prj.teamboard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kh.prj.paging.PagingCriteria;
import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.vo.FileVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Service
public class TeamboardDAOImpl implements TeamboardDAO {
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public List<TeamboardVO> boardList(PagingCriteria paging) {
		
		System.out.println(paging.toString());
		return sqlSession.selectList("mappers.TeamboardDAO-mapper.boardList",paging);
	}
	
	@Override
	public TeamboardVO boardView(int bno) {
		return sqlSession.selectOne("mappers.TeamboardDAO-mapper.boardView",bno);
	}
	
	@Override
	public int boardWrite(TeamboardVO vo) {
		return sqlSession.insert("mappers.TeamboardDAO-mapper.boardWrite",vo);
	}
	
	@Override
	public int boardDelete(int bno) {
		return sqlSession.delete("mappers.TeamboardDAO-mapper.boardDelete",bno);
	}
	
	@Override
	public int boardMod(TeamboardVO vo) {
		return sqlSession.update("mappers.TeamboardDAO-mapper.boardMod",vo);
	}
	
	@Override
	public int boardReply(TeamboardVO vo) {
		return sqlSession.insert("mappers.TeamboardDAO-mapper.boardReply",vo);
	}
	
	@Override
	public int fileupload(FileVO fvo) {
		System.out.println(fvo.toString());
		return sqlSession.insert("mappers.TeamboardDAO-mapper.fileupload",fvo);
	}
	
	@Override
	public List<FileVO> fileList(PagingCriteria paging) {
		return sqlSession.selectList("mappers.TeamboardDAO-mapper.fileList",paging);
	}
	
	@Override
	public FileVO fileView(int bno) {
		return sqlSession.selectOne("mappers.TeamboardDAO-mapper.fileView",bno);
	}
	
	@Override
	public int fileMod(FileVO fvo) {
		return sqlSession.update("mappers.TeamboardDAO-mapper.fileMod",fvo);
	}
	
	@Override
	public int fileDelete(int bno) {
		return sqlSession.delete("mappers.TeamboardDAO-mapper.fileDelete",bno);
	}
	
	@Override
	public int totalCnt(int tno) {
		return sqlSession.selectOne("mappers.TeamboardDAO-mapper.getTotalCnt",tno);
	}
	
	@Override
	public int totalCntboard(int tno) {
		return sqlSession.selectOne("mappers.TeamboardDAO-mapper.getTotalBoardCnt",tno);
	}
	
	
}
