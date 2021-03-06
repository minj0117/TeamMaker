package com.kh.prj.dae.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.dae.dao.DaeDAO;
import com.kh.prj.dae.vo.DaeVO;
import com.kh.prj.paging.PagingCriteria;

@Service
public class DaeSVCImpl implements DaeSVC {
	@Inject
	@Qualifier("daeDAOImpl")
	DaeDAO daeDAO;
	
	@Override
	public int insertDae(DaeVO daeVO) {
		return daeDAO.insertDae(daeVO);
	}
	@Override
	public List<DaeVO> dlist(PagingCriteria paging) {
		return daeDAO.dlist(paging);
	}
	@Override
	public DaeVO dview(int dno) {
		return daeDAO.dview(dno);
	}
	@Override
	public int DaeMod(DaeVO daeVO) {
		return daeDAO.DaeMod(daeVO);
	}
	@Override
	public int del(int dno) {
		return daeDAO.del(dno);
	}
	
	@Override
	public List<DaeVO> checklist(List<String> value) {
		return daeDAO.checklist(value);
	}
	
	@Override
	public int getTotalCnt() {
		return daeDAO.getTotalCnt();
	}
	
	@Override
	public List<DaeVO> rank() {
		return daeDAO.rank();
	}
}
