package com.kh.byulmee.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.mypage.model.dao.MypageDAO;
import com.kh.byulmee.order.model.vo.Order;
import com.kh.byulmee.review.model.vo.Review;

@Service("mpService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO mpDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member memberLogin(Member m) {
		return mpDAO.selectMember(sqlSession, m);
	}
	
	@Override
	public int updateMyInfo(Member m) {
		return mpDAO.updateMyInfo(sqlSession, m);
	}

	@Override
	public int updateMyPwd(HashMap<String, String> map) {
		return mpDAO.updateMyPwd(sqlSession, map);
	}

	@Override
	public int deleteMember(String id) {
		return mpDAO.deleteMember(sqlSession, id);
	}

	@Override
	public int getOrderListCount(String id) {
		return mpDAO.getOrderListCount(sqlSession, id);
	}

	@Override
	public ArrayList<Order> selectOrderList(PageInfo pi, String id) {
		return mpDAO.selectOrderList(sqlSession, pi, id);
	}

	@Override
	public ArrayList<Order> selectDetailList(int ordNo) {
		return mpDAO.selectDetailList(sqlSession, ordNo);
	}

	@Override
	public int insertProfileImage(Image i) {
		return mpDAO.insertProfileImage(sqlSession, i);
	}

	@Override
	public ArrayList<Image> selectProfileImg(int memNo) {
		return mpDAO.selectProfileImg(sqlSession, memNo);
	}

	@Override
	public int insertReview(Review r) {
		int revNo = mpDAO.insertReview(sqlSession, r);
		return revNo;
	}
}
