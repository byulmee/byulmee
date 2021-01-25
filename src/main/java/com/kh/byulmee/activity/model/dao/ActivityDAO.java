package com.kh.byulmee.activity.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.activity.model.vo.Activity;
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



}
