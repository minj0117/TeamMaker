package com.kh.prj.admin.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession sqlSession;
	

}
