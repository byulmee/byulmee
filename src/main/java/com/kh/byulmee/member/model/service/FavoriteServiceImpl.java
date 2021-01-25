package com.kh.byulmee.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.member.model.dao.FavoriteDAO;

@Service("fService")
public class FavoriteServiceImpl implements FavoriteService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FavoriteDAO fDAO;

	@Override
	public int insertActivityFavorite(int acId) {
		return fDAO.insertActivityFavorite(sqlSession, acId);
	}

}
