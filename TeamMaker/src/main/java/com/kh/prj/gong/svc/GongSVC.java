package com.kh.prj.gong.svc;

import java.util.List;

import com.kh.prj.gong.vo.GongVO;
import com.kh.prj.paging.PagingCriteria;

public interface GongSVC {
	public int insertGong(GongVO gongVO);

	public List<GongVO> glist(PagingCriteria paging);

	public GongVO gview(int gno);

	public int GongMod(GongVO gongVO);

	public int del(int gno);
	
	public int getTotalCnt();
}
