package com.kh.byulmee.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.member.model.vo.Favorite;

@Repository("fDAO")
public class FavoriteDAO {

	public int insertActivityFavorite(SqlSessionTemplate sqlSession, int acId) {
		return sqlSession.insert("favoriteMapper.insertActivityFavorite", acId);
	}

	public int selectStarFavorite(SqlSessionTemplate sqlSession, Favorite f) {
		return sqlSession.selectOne("favoriteMapper.selectStarFavorite", f);
	}

	public int starFavInsert(SqlSessionTemplate sqlSession, Favorite f) {
		return sqlSession.insert("favoriteMapper.starFavInsert", f);
	}

	public int starFavDelete(SqlSessionTemplate sqlSession, Favorite f) {
		return sqlSession.update("favoriteMapper.starFavDelete", f);
	}

}
