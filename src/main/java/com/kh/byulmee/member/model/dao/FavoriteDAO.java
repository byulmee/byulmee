package com.kh.byulmee.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("fDAO")
public class FavoriteDAO {

	public int insertActivityFavorite(SqlSessionTemplate sqlSession, int acId) {
		return sqlSession.insert("favoriteMapper.insertActivityFavorite", acId);
	}
	

}
