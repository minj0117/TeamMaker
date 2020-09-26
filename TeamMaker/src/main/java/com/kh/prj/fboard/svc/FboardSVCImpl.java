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
	public int pwCheck(FboardVO vo) {
		return fboardDAO.pwCheck(vo);
	}
	
	@Override
	public int fboardMod(FboardVO vo) {
		return fboardDAO.fboardMod(vo);
	}
	
	@Override
	public int fboardDel(FboardVO vo) {
		return fboardDAO.fboardDel(vo);
	}
	
	@Override
	public List<FboardVO> viewReply(int fno) {
		return fboardDAO.viewReply(fno);
	}
	
	@Override
	public int replyinsert(FboardVO vo) {
		return fboardDAO.replyinsert(vo);
	}
	@Override
	public int replydelete(int fno) {
		return fboardDAO.replydelete(fno);
	}
}
