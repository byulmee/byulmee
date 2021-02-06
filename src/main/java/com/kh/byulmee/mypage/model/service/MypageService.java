package com.kh.byulmee.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.vo.Favorite;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.mypage.model.vo.RevImgChange;
import com.kh.byulmee.order.model.vo.Order;
import com.kh.byulmee.review.model.vo.Review;

public interface MypageService {

	Member memberLogin(Member m);

	int updateMyInfo(Member m);

	int updateMyPwd(HashMap<String, String> map);

	int deleteMember(String id);

	int getOrderListCount(Order ord);

	ArrayList<Order> selectActOrderList(PageInfo pi, String id);

	ArrayList<Order> selectProOrderList(PageInfo pi, String id);

	ArrayList<Order> selectActDetailList(int ordNo);
	
	ArrayList<Order> selectProDetailList(int ordNo);
	
	int deletePur(Order o);

	int insertProfileImage(Image img);

	Image selectProfileImg(int memNo);

	int deleteProfileImg(int memNo);

	int insertReview(Review r);

	int updateReviewStatus(Review r);

	int getFavListCount(Favorite fav);

	ArrayList<Favorite> selectFavActList(PageInfo pi, String id);
	
	ArrayList<Favorite> selectFavProList(PageInfo pi, String id);
	
	ArrayList<Favorite> selectFavStarList(PageInfo pi, String id);

	int deleteFav(Favorite f);

	int getReviewListCount(Review rev);

	ArrayList<Review> selectRevActList(PageInfo pi, String id);

	ArrayList<Review> selectRevProList(PageInfo pi, String id);

	Review selectRevActDetail(int revNo);
	
	Review selectRevProDetail(int revNo);

	int updateRevAct(Review r);
	
	ArrayList<Image> selectRevDetailImg(int revNo);

	int changeImgLevel(RevImgChange ric);


}
