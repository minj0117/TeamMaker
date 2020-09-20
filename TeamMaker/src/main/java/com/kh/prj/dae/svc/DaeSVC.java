package com.kh.prj.dae.svc;

import java.util.List;

import com.kh.prj.dae.vo.DaeVO;

public interface DaeSVC {
	public int insertDae(DaeVO daeVO);
	public List<DaeVO> dlist();
	public DaeVO dview(int dno);
	public int DaeMod(DaeVO daeVO);
	public int del(int dno);
	public List<DaeVO> checklist(List<String> value);
}
