package com.kh.byulmee.activity.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.activity.model.dao.ActivityDAO;
import com.kh.byulmee.activity.model.vo.Activity;

@Service("acService")
public class ActivityServiceImpl implements ActivityService {
	
	@Autowired
	private ActivityDAO acDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Activity selectActivity(int acId) {
		
		int result = acDAO.addReadCount(sqlSession, acId);
		
		Activity ac = null;
		if(result > 0) {
			ac = acDAO.selectActivity(sqlSession, acId);
		}
		
		return ac;
	}

}
