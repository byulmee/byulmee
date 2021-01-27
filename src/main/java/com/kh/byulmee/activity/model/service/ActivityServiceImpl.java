package com.kh.byulmee.activity.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.activity.model.dao.ActivityDAO;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;


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

	@Override
	public int getListCount() {
		return aDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Activity> selectList(PageInfo pi) {
		
		return aDAO.selectList(sqlSession, pi);
	}
	
	

	@Override
	public Activity selectAct(int actNo) {
		
		return aDAO.selectAct(sqlSession, actNo);
	}

	@Override
	public int actUnableUpdate(int actNo) {
		
		return aDAO.actUnableUpdate(sqlSession, actNo);
	}

	@Override
	public int actAbleUpdate(int actNo) {
		
		return aDAO.actAbleUpdate(sqlSession, actNo);
	}

	@Override
	public int deleteAct(int actNo) {
		return aDAO.deleteAct(sqlSession, actNo);
	}

	@Override
	public int updateActivity(Activity a) {
		
		return aDAO.updateActivity(sqlSession, a);
	}

	@Override
	public Activity selectList(int acId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Activity> selectActivity(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		return null;
	}
}
