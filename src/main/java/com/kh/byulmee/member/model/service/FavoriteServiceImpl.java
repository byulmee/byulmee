package com.kh.byulmee.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.member.model.dao.FavoriteDAO;
import com.kh.byulmee.member.model.vo.Favorite;

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

	@Override
	public int selectStarFavorite(Favorite f) {
		return fDAO.selectStarFavorite(sqlSession, f);
	}

	@Override
	public int starFavInsert(Favorite f) {
		return fDAO.starFavInsert(sqlSession, f);
	}

	@Override
	public int starFavDelete(Favorite f) {
		return fDAO.starFavDelete(sqlSession, f);
	}

}
