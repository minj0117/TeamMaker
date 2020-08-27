package com.kh.prj.apply.dao;

import java.util.List;

import com.kh.prj.apply.vo.ApplyVO;

public interface ApplyDAO {
	public int check(ApplyVO applyVO);
	public int addlist(ApplyVO applyVO);
}
