package com.kh.prj.fboard.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.fboard.dao.FboardDAO;
import com.kh.prj.fboard.vo.FboardVO;
import com.kh.prj.paging.PagingCriteria;

@Service
public class FboardSVCImpl implements FboardSVC {
	@Inject
	@Qualifier("fboardDAOImpl")
	FboardDAO fboardDAO;
	
	@Override
	public int write(FboardVO vo) {
		return fboardDAO.write(vo);
	}
	@Override
	public int totalCnt() {
		return fboardDAO.totalCnt();
	}

	@Override
	public List<FboardVO> fboardList(PagingCriteria paging) {
		List<FboardVO> list = null;
		list = fboardDAO.fboardList(paging);
		return list;
	}
	
	@Override
	public FboardVO view(int fno) {
		return fboardDAO.view(fno);
	}
	
	@Override
	public List<FboardVO> viewReply(int fgroup) {
		return fboardDAO.viewReply(fgroup);
	}
}
