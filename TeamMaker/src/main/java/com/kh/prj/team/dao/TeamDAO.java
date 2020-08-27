package com.kh.prj.team.dao;

import java.util.List;

import com.kh.prj.apply.vo.ApplyVO;
import com.kh.prj.team.vo.TeamVO;

public interface TeamDAO {
	public int makeTeam(TeamVO teamVO);
	public List<TeamVO> teamlist();
	public List<TeamVO> myList(String id);
	public List<ApplyVO> myteam(int tno);
}
