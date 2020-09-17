package com.kh.prj.team.svc;

import java.util.List;

import com.kh.prj.apply.vo.ApplyVO;
import com.kh.prj.team.vo.TeamVO;
import com.kh.prj.team.vo.TeammemberVO;

public interface TeamSVC {
	/**
	 * 팀 생성창
	 * @param teamVO
	 * @return
	 */
	public int makeTeam(TeamVO teamVO);
	/**
	 * 팀 리스트 보기
	 * @return
	 */
	public List<TeamVO> teamlist();
	/**
	 * 내팀 목록 보기
	 * @param id
	 * @return
	 */
	public List<TeamVO> myList(String id);
	
	public List<TeammemberVO> affiliationTno(String id);
	public List<TeamVO> sosok(int tno);
	
	/**
	 * 내팀 지원자 보기
	 * @param tno
	 * @return
	 */
	public List<ApplyVO> myteam(int tno);
	/**
	 * 팀원 추가
	 * @param teammemberVO
	 * @return
	 */
	public int addmember(TeammemberVO teammemberVO);
	/**
	 * 내팀 멤버 보기
	 * @param tno
	 * @return
	 */
	public List<TeammemberVO> mymember(int tno);
	/**
	 * 팀원 추가 시 지원 목록에서 삭제
	 * @param tno
	 * @return
	 */
	public int delapply(int tno);
}
