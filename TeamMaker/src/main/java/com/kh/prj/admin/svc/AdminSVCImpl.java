package com.kh.prj.admin.svc;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.prj.admin.dao.AdminDAO;
@Service
public class AdminSVCImpl implements AdminSVC {
	@Inject
	@Qualifier("adminDAOImpl")
	AdminDAO adminDAO;
	
}
