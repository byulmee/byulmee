package com.kh.byulmee.member.model.service;

import com.kh.byulmee.member.model.vo.Favorite;

public interface FavoriteService {

	int insertActivityFavorite(int acId);

	int selectStarFavorite(Favorite f);

	int starFavInsert(Favorite f);

	int starFavDelete(Favorite f);



}
