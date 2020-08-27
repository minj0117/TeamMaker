package com.kh.prj.apply.svc;

import java.util.List;

import com.kh.prj.apply.vo.ApplyVO;

public interface ApplySVC {
	public int check(ApplyVO applyVO);
	public int addlist(ApplyVO applyVO);
}
