package com.kh.byulmee.activity.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.member.model.vo.Member;


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



	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("activityMapper.getListCount");
	}

	public ArrayList<Activity> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("activityMapper.selectList", null, rowBounds);
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

}
