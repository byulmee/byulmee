package com.kh.byulmee.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.order.model.vo.Order;
import com.kh.byulmee.review.model.vo.Review;

public interface MypageService {

	Member memberLogin(Member m);

	int updateMyInfo(Member m);

	int updateMyPwd(HashMap<String, String> map);

	int deleteMember(String id);

	int getOrderListCount(String id);

	ArrayList<Order> selectOrderList(PageInfo pi, String id);

	ArrayList<Order> selectDetailList(int ordNo);

	int insertProfileImage(Image img);

	ArrayList<Image> selectProfileImg(int memNo);

	int insertReview(Review r);
}
