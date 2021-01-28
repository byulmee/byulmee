package com.kh.byulmee.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.review.model.dao.ReviewDAO;
import com.kh.byulmee.review.model.vo.Review;

@Service("rvService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReviewDAO rvDAO;

	@Override
	public ArrayList<Review> selectReviewList(int acId) {
		return rvDAO.selectReviewList(sqlSession, acId);
	}

	@Override
	public Review selectReviewDetail(int revNo) {
		return rvDAO.selectReviewDetail(sqlSession, revNo);
	}

	@Override
	public ArrayList<Review> selectReviewAll(int acId) {
		return rvDAO.selectReviewAll(sqlSession, acId);
	}


}
