package com.kh.prj.teamboard.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.dao.TeamboardDAO;
import com.kh.prj.teamboard.vo.TeamboardReplyVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

@Repository
public class TeamboardSVCImpl implements TeamboardSVC {
	@Inject
	@Qualifier("teamboardDAOImpl")
	TeamboardDAO teamboardDAO;
	
	@Override
	public TeammemberVO checkmember(TeammemberVO teammemberVO) {
		System.out.println(" svc : " + teammemberVO.toString());
		return teamboardDAO.checkmember(teammemberVO);
	}
	
	@Override
	public String checkowner(int tno) {
		return teamboardDAO.checkowner(tno);
	}
	
	@Override
	public List<TeamboardVO> tboardlist(int tno) {
		return teamboardDAO.tboardlist(tno);
	}
	
	@Override
	public TeamboardVO tboarddetail(int bno) {
		return teamboardDAO.tboarddetail(bno);
	}
	@Override
	public int tboardcnt(int bno) {
		return teamboardDAO.tboardcnt(bno);
	}
	
	/**
	 * 게시글 작성
	 */
	@Override
	public int write(TeamboardVO teamboardVO) {
		return teamboardDAO.write(teamboardVO);
	}
	@Override
	public int delete(int bno) {
		return teamboardDAO.delete(bno);
	}
	@Override
	public int modify(TeamboardVO teamboardVO) {
		return teamboardDAO.modify(teamboardVO);
	}
	
	
	
	@Override
	public List<TeamboardReplyVO> showreply(int bno) {
		return teamboardDAO.showreply(bno);
	}
	@Override
	public int writeReply(TeamboardReplyVO teamboardReplyVO) {
		return teamboardDAO.writeReply(teamboardReplyVO);
	}
	@Override
	public int modifyReply(TeamboardReplyVO teamboardReplyVO) {
		return teamboardDAO.modifyReply(teamboardReplyVO);
	}
	@Override
	public int deleteReply(int rno) {
		return teamboardDAO.deleteReply(rno);
	}
	@Override
	public TeamboardReplyVO detailReply(int rno) {
		return teamboardDAO.detailReply(rno);
	}
	/**
	 * 대댓글 작성
	 */
	@Override
	public int rereply(TeamboardReplyVO teamboardReplyVO) {
		return teamboardDAO.rereply(teamboardReplyVO);
	}
	/**
	 * 대댓글 조회
	 */
	@Override
	public List<TeamboardReplyVO> showrereply(int rgroup) {
		return teamboardDAO.showrereply(rgroup);
	}
}
