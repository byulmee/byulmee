package com.kh.byulmee.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.vo.Favorite;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.mypage.model.dao.MypageDAO;
import com.kh.byulmee.mypage.model.vo.RevImgChange;
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
	public int getOrderListCount(Order ord) {
		return mpDAO.getOrderListCount(sqlSession, ord);
	}

	@Override
	public ArrayList<Order> selectActOrderList(PageInfo pi, String id) {
		return mpDAO.selectActOrderList(sqlSession, pi, id);
	}
	
	@Override
	public ArrayList<Order> selectProOrderList(PageInfo pi, String id) {
		return mpDAO.selectProOrderList(sqlSession, pi, id);
	}

	@Override
	public ArrayList<Order> selectActDetailList(int ordNo) {
		return mpDAO.selectActDetailList(sqlSession, ordNo);
	}
	
	@Override
	public ArrayList<Order> selectProDetailList(int ordNo) {
		return mpDAO.selectProDetailList(sqlSession, ordNo);
	}
	
	@Override
	public int deletePur(Order o) {
		return mpDAO.deletePur(sqlSession, o);
	}

	@Override
	public int insertProfileImage(Image i) {
		return mpDAO.insertProfileImage(sqlSession, i);
	}

	@Override
	public Image selectProfileImg(int memNo) {
		return mpDAO.selectProfileImg(sqlSession, memNo);
	}

	@Override
	public int deleteProfileImg(int memNo) {
		return mpDAO.deleteProfileImg(sqlSession, memNo);
	}

	@Override
	public int insertReview(Review r) {
		int revNo = mpDAO.insertReview(sqlSession, r);
		return revNo;
	}

	@Override
	public int updateReviewStatus(Review r) {
		return mpDAO.updateReviewStatus(sqlSession, r);
	}

	@Override
	public int getFavListCount(Favorite fav) {
		return mpDAO.getFavListCount(sqlSession, fav);
	}

	@Override
	public ArrayList<Favorite> selectFavActList(PageInfo pi, String id) {
		return mpDAO.selectFavActList(sqlSession, pi, id);
	}

	@Override
	public ArrayList<Favorite> selectFavProList(PageInfo pi, String id) {
		return mpDAO.selectFavProList(sqlSession, pi, id);
	}
	
	@Override
	public ArrayList<Favorite> selectFavStarList(PageInfo pi, String id) {
		return mpDAO.selectFavStarList(sqlSession, pi, id);
	}

	@Override
	public int deleteFav(Favorite f) {
		return mpDAO.deleteFav(sqlSession, f);
	}

	@Override
	public int getReviewListCount(Review rev) {
		return mpDAO.getReviewListCount(sqlSession, rev);
	}

	@Override
	public ArrayList<Review> selectRevActList(PageInfo pi, String id) {
		return mpDAO.selectRevActList(sqlSession, pi, id);
	}
	
	@Override
	public ArrayList<Review> selectRevProList(PageInfo pi, String id) {
		return mpDAO.selectRevProList(sqlSession, pi, id);
	}

	@Override
	public ArrayList<Image> selectRevDetailImg(int revNo) {
		return mpDAO.selectRevDetailImg(sqlSession, revNo);
	}

	@Override
	public Review selectRevActDetail(int revNo) {
		return mpDAO.selectRevActDetail(sqlSession, revNo);
	}

	@Override
	public Review selectRevProDetail(int revNo) {
		return mpDAO.selectRevProDetail(sqlSession, revNo);
	}

	@Override
	public int updateRevAct(Review r) {
		return mpDAO.updateRevAct(sqlSession, r);
	}

	@Override
	public int changeImgLevel(RevImgChange ric) {
		return mpDAO.changeImgLevel(sqlSession, ric);
	}

	@Override
	public void deleteRev(Review r) {
		mpDAO.deleteRev(sqlSession, r);
	}

	@Override
	public int deleteReviewStatus(Review r) {
		return mpDAO.deleteReviewStatus(sqlSession, r);
	}

	@Override
	public int getQnACusListCount(CustomerQna cus) {
		return mpDAO.getQnACusListCount(sqlSession, cus);
	}

	@Override
	public ArrayList<CustomerQna> selectQnACusList(PageInfo pi, String id) {
		return mpDAO.selectQnACusList(sqlSession, pi, id);
	}

}
