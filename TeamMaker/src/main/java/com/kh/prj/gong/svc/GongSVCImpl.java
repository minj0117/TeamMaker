package com.kh.prj.gong.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.gong.dao.GongDAO;
import com.kh.prj.gong.vo.GongVO;
import com.kh.prj.paging.PagingCriteria;
@Service
public class GongSVCImpl implements GongSVC {
	@Inject
	@Qualifier("gongDAOImpl")
	GongDAO gongDAO;

	@Override
	public int insertGong(GongVO gongVO) {

		return gongDAO.insertGong(gongVO);
	}

	@Override
	public List<GongVO> glist(PagingCriteria paging) {

		return gongDAO.glist(paging);
	}

	@Override
	public GongVO gview(int gno) {

		return gongDAO.gview(gno);
	}

	@Override
	public int GongMod(GongVO gongVO) {

		return gongDAO.GongMod(gongVO);
	}

	@Override
	public int del(int gno) {

		return gongDAO.del(gno);
	}
	
	@Override
	public int getTotalCnt() {
		// TODO Auto-generated method stub
		return gongDAO.getTotalCnt();
	}
	
	@Override
	public List<GongVO> checklist(List<String> value) {
		return gongDAO.checklist(value);
	}
	
	@Override
	public int selectTotal(List<String> value) {
		return gongDAO.selectTotal(value);
	}
	
	@Override
	public List<GongVO> rank() {
		return gongDAO.rank();
	}
}
