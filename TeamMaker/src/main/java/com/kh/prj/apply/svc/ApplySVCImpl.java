package com.kh.prj.apply.svc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.apply.dao.ApplyDAO;
import com.kh.prj.apply.vo.ApplyVO;
import com.kh.prj.apply.vo.MyApplyVO;
@Service
public class ApplySVCImpl implements ApplySVC {
	
	
	@Inject
	@Qualifier("applyDAOImpl")
	ApplyDAO applyDAO;
	
	@Override
	public int check(ApplyVO applyVO) {
		return applyDAO.check(applyVO);
	}
	
	@Override
	public int addlist(ApplyVO applyVO) {
		return applyDAO.addlist(applyVO);
	}
	
	@Override
	public List<MyApplyVO> mypageapplylist(String id) {
		return applyDAO.mypageapplylist(id);
	}
}
