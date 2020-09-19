package com.kh.prj.gong.dao;

import java.util.List;

import com.kh.prj.gong.vo.GongVO;

public interface GongDAO {
	public int insertGong(GongVO gongVO);

	public List<GongVO> glist();

	public GongVO gview(int gno);

	public int GongMod(GongVO gongVO);

	public int del(int gno);
}
