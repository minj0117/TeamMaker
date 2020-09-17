package com.kh.prj.apply.svc;

import java.util.List;

import com.kh.prj.apply.vo.ApplyVO;
import com.kh.prj.apply.vo.MyApplyVO;

public interface ApplySVC {
	public int check(ApplyVO applyVO);
	public int addlist(ApplyVO applyVO);
	public List<MyApplyVO> mypageapplylist(String id);
}
