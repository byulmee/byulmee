package com.kh.byulmee.review.model.service;

import java.util.ArrayList;

import com.kh.byulmee.review.model.vo.Review;

public interface ReviewService {

	ArrayList<Review> selectReviewList(int acId);

	Review selectReviewDetail(int revNo);

	ArrayList<Review> selectReviewAll(int acId);


}
