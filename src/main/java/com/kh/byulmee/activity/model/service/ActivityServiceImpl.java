package com.kh.byulmee.activity.model.service;

import java.util.ArrayList;

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
	public int getListCount(String memId) {
		return aDAO.getListCount(sqlSession, memId);
	}
	
	@Override
	public int getActBoardListCount(int actCategory) {
		return aDAO.getActBoardListCount(sqlSession,actCategory);
	}

	@Override
	public ArrayList<Activity> selectList(String memId, PageInfo pi) {
		
		return aDAO.selectList(sqlSession, memId, pi);
	}
	
	@Override
	public ArrayList<Activity> selectList(PageInfo pi, int actCategory) {
		
		return aDAO.selectList(sqlSession, pi, actCategory);
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
	
	//활동 검색 결과 게시글 전체 개수
	@Override
	public int getActSearchListCount(String[] keywords) {
		return aDAO.getActSearchListCount(sqlSession, keywords);
	}
	
	//활동 검색 결과 게시글 전체 리스트
	@Override
	public ArrayList<Activity> getActSearchResult(PageInfo pi, String[] keywords) {
		return aDAO.getActSearchResult(sqlSession, pi, keywords);
	}

	@Override
	public int selectOrderSum(int acId) {
		return aDAO.selectOrderSum(sqlSession, acId);
	}
  
	public ArrayList<Activity> getPopularActList() {
		return aDAO.getPopularActList(sqlSession);
	}

	@Override
	public ArrayList<Activity> getNearEndDateActList() {
		return aDAO.getNearEndDateActList(sqlSession);
	}

	@Override
	public int getUserListCount(String memId) {
		return aDAO.getUserListCount(sqlSession, memId);
	}

	@Override
	public ArrayList<Activity> selectUserList(String memId, PageInfo pi) {
		return aDAO.selectUserList(sqlSession, memId, pi);
	}

	@Override
	public int updateActRatingCnt(Activity a) {
		return aDAO.updateActRatingCnt(sqlSession, a);
	}
	
	}
