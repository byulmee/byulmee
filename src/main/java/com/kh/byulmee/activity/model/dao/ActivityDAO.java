package com.kh.byulmee.activity.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.activity.model.vo.Activity;

@Repository("acDAO")
public class ActivityDAO {

	public int addReadCount(SqlSessionTemplate sqlSession, int acId) {
		return sqlSession.update("activityMapper.addReadCount", acId);
	}

	public Activity selectActivity(SqlSessionTemplate sqlSession, int acId) {
		return sqlSession.selectOne("activityMapper.selectActivity", acId);
	}

}
