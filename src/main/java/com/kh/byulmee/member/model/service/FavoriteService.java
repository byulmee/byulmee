package com.kh.byulmee.member.model.service;

import com.kh.byulmee.member.model.vo.Favorite;

public interface FavoriteService {

	int insertActivityFavorite(Favorite fv);

	int insertStarFavorite(Favorite fv);

	int insertProductFavorite(Favorite fv);

}
