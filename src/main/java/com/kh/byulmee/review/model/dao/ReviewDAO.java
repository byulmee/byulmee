package com.kh.byulmee.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.review.model.vo.Review;

@Repository("rvDAO")
public class ReviewDAO {

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, int acId) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewList", acId);
	}

	public Review selectReviewDetail(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.selectOne("reviewMapper.selectReviewDetail", revNo);
	}

	public ArrayList<Review> selectReviewAll(SqlSessionTemplate sqlSession, int acId) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewAll", acId);
	}

	public ArrayList<Review> selectProductReviewAll(SqlSessionTemplate sqlSession, int pdId) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectProductReviewAll", pdId);
	}

	public ArrayList<Review> selectProductReviewList(SqlSessionTemplate sqlSession, int pdId) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectProductReviewList", pdId);
	}

	public Review salesProductReviewDetail(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.selectOne("reviewMapper.salesProductReviewDetail", revNo);
	}


}
