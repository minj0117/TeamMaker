package com.kh.prj.apply.dao;

import java.util.List;

import com.kh.prj.apply.vo.ApplyVO;
import com.kh.prj.apply.vo.MyApplyVO;

public interface ApplyDAO {
	public int check(ApplyVO applyVO);
	public int addlist(ApplyVO applyVO);
	public List<MyApplyVO> mypageapplylist(String id);
}
