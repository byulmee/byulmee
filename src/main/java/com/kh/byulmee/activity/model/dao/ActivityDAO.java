package com.kh.byulmee.activity.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;


@Repository("aDAO")
public class ActivityDAO {

	public int insertActivity(SqlSessionTemplate sqlSession, Activity a) {
		sqlSession.insert("activityMapper.insertActivity", a);
		int actNo = a.getActNo();
		return actNo;
	}
		
	public int addReadCount(SqlSessionTemplate sqlSession, int acId) {
		return sqlSession.update("activityMapper.addReadCount", acId);
	}
	public Activity selectActivity(SqlSessionTemplate sqlSession, int acId) {
		return sqlSession.selectOne("activityMapper.selectActivity", acId);	
	}

	public int getListCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("activityMapper.getListCount", memId);
	}

	public ArrayList<Activity> selectList(SqlSessionTemplate sqlSession, String memId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("activityMapper.selectList", memId, rowBounds);
	}

	public Activity selectAct(SqlSessionTemplate sqlSession, int actNo) {
		
		return sqlSession.selectOne("activityMapper.selectAct", actNo);
	}

	public int actUnableUpdate(SqlSessionTemplate sqlSession, int actNo) {
		
		return sqlSession.update("activityMapper.actUnableUpdate", actNo);
	}

	public int actAbleUpdate(SqlSessionTemplate sqlSession, int actNo) {
		
		return sqlSession.update("activityMapper.actAbleUpdate", actNo);
	}

	public int deleteAct(SqlSessionTemplate sqlSession, int actNo) {
		
		return sqlSession.delete("activityMapper.deleteAct", actNo);
	}

	public int updateActivity(SqlSessionTemplate sqlSession, Activity a) {
		
		return sqlSession.update("activityMapper.updateActivity", a);
	}

	public int selectOrderSum(SqlSessionTemplate sqlSession, int acId) {
		return sqlSession.selectOne("activityMapper.selectOrderSum", acId);
	}
	
	public int getUserListCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("activityMapper.getUserListCount", memId);
	}

	public ArrayList<Activity> selectUserList(SqlSessionTemplate sqlSession, String memId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("activityMapper.selectUserList", memId, rowBounds);
	}

	public int getActSearchListCount(SqlSessionTemplate sqlSession, String[] keywords) {
		return sqlSession.selectOne("activityMapper.getActSearchListCount", keywords);
	}
	
	public ArrayList<Activity> getActSearchResult(SqlSessionTemplate sqlSession, PageInfo pi, String[] keywords) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("activityMapper.actSearchLsit", keywords, rowBounds);
	}

	public ArrayList<Activity> getPopularActList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("activityMapper.getPopularActList");
	}

	public ArrayList<Activity> getNearEndDateActList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("activityMapper.getNearEndDateActList");
	}
	
	public int updateActRatingCnt(SqlSessionTemplate sqlSession, Activity a) {
		return sqlSession.update("activityMapper.updateActRatingCnt", a);
	}
	
	public ArrayList<Activity> selectList(SqlSessionTemplate sqlSession,PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList) sqlSession.selectList("activityMapper.selectActBoardList",pi,rowBounds);
		
	}
	
	public int getActBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("activityMapper.getActBoardListCount");		
	}
	
}
