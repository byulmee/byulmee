package com.kh.byulmee.activity.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.activity.model.vo.Activity;

@Repository("aDAO")
public class ActivityDAO {

	public int insertActivity(SqlSessionTemplate sqlSession, Activity a) {
		sqlSession.insert("activityMapper.insertActivity", a);
		int actNo = a.getActNo();
		return actNo;
	}

}