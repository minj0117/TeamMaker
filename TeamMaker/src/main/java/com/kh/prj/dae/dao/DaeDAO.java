package com.kh.prj.dae.dao;

import java.util.List;

import com.kh.prj.dae.vo.DaeVO;
import com.kh.prj.paging.PagingCriteria;

public interface DaeDAO {
	public int insertDae(DaeVO daeVO);
	public List<DaeVO> dlist(PagingCriteria paging);
	public DaeVO dview(int dno);
	public int DaeMod(DaeVO daeVO);
	public int del(int dno);
	public List<DaeVO> checklist(List<String> value);
	public int getTotalCnt();
	
	public List<DaeVO> rank();
}
