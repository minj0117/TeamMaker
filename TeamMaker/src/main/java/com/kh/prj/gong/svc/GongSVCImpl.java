package com.kh.prj.gong.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.gong.dao.GongDAO;
import com.kh.prj.gong.vo.GongVO;
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
	public List<GongVO> glist() {

		return gongDAO.glist();
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
}
