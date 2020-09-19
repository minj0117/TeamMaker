package com.kh.prj.dae.dao;

import java.util.List;

import com.kh.prj.dae.vo.DaeVO;

public interface DaeDAO {
	public int insertDae(DaeVO daeVO);
	public List<DaeVO> dlist();
	public DaeVO dview(int dno);
	public int DaeMod(DaeVO daeVO);
	public int del(int dno);
}
