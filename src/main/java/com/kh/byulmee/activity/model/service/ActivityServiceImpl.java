package com.kh.byulmee.activity.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.activity.model.dao.ActivityDAO;
import com.kh.byulmee.activity.model.vo.Activity;

@Service("aService")
public class ActivityServiceImpl implements ActivityService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ActivityDAO aDAO;

	@Override
	public int insertActivity(Activity a) {
		int actNo = aDAO.insertActivity(sqlSession, a);
		return actNo;
	}
	
	@Override
	public Activity selectActivity(int acId) {
		
		int result = aDAO.addReadCount(sqlSession, acId);
		
		Activity ac = null;
		if(result > 0) {
			ac = aDAO.selectActivity(sqlSession, acId);
		}
		return ac;
	}

}
