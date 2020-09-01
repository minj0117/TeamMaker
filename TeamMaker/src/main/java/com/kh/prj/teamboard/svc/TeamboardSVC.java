package com.kh.prj.teamboard.svc;

import java.util.List;

import com.kh.prj.team.vo.TeammemberVO;
import com.kh.prj.teamboard.vo.TeamboardReplyVO;
import com.kh.prj.teamboard.vo.TeamboardVO;

public interface TeamboardSVC {
	/**
	 * 팀멤버 확인
	 * @param teammemberVO
	 * @return
	 */
	public TeammemberVO checkmember(TeammemberVO teammemberVO);
	/**
	 * 팀장 확인
	 * @param tno
	 * @return
	 */
	public String checkowner(int tno);
	/**
	 * 팀 게시글 리스트
	 * @param tno
	 * @return
	 */
	public List<TeamboardVO> tboardlist(int tno);
	/**
	 * 게시글 상세조회
	 * @param bno
	 * @return
	 */
	public TeamboardVO tboarddetail(int bno);
	
	/**
	 * 조회수 증가
	 * @return
	 */
	public int tboardcnt(int bno);
	
	
	public int write(TeamboardVO teamboardVO);
	
	
	
	
	
	public List<TeamboardReplyVO> showreply(int bno);
	public int writeReply(TeamboardReplyVO teamboardReplyVO);
	
}
