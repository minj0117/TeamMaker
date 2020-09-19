package com.kh.prj.fboard.svc;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.fboard.dao.FboardDAO;
import com.kh.prj.fboard.vo.FboardVO;

@Service
public class FboardSVCImpl implements FboardSVC {
	@Inject
	@Qualifier("fboardDAOImpl")
	FboardDAO fboardDAO;
	
	@Override
	public int write(FboardVO vo) {
		return fboardDAO.write(vo);
	}

}
