package com.kh.byulmee.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.vo.Favorite;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.mypage.model.vo.RevImgChange;
import com.kh.byulmee.order.model.vo.Order;
import com.kh.byulmee.review.model.vo.Review;

@Repository("mpDAO")
public class MypageDAO {
	
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("mypageMapper.selectOne", m);
	}

	public int updateMyInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("mypageMapper.updateMyInfo", m);
	}

	public int updateMyPwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("mypageMapper.updateMyPwd", map);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("mypageMapper.deleteMember", id);
	}

	public int getOrderListCount(SqlSessionTemplate sqlSession, Order ord) {
		return sqlSession.selectOne("mypageMapper.getOrderListCount", ord);
	}
	
	public int getProOrderListCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("mypageMapper.getProOrderListCount", id);
	}

	public ArrayList<Order> selectActOrderList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectActOrderList", id, rowBounds);
	}
	
	public ArrayList<Order> selectProOrderList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectProOrderList", id, rowBounds);
	}

	public ArrayList<Order> selectActDetailList(SqlSessionTemplate sqlSession, int ordNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectActDetailList", ordNo);
	}
	
	public ArrayList<Order> selectProDetailList(SqlSessionTemplate sqlSession, int ordNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectProDetailList", ordNo);
	}

	public int deletePur(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("mypageMapper.deletePur", o);
	}

	public int insertProfileImage(SqlSessionTemplate sqlSession, Image i) {
		return sqlSession.insert("mypageMapper.insertProfileImage", i);
	}

	public Image selectProfileImg(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("mypageMapper.selectProfileImg", memNo);
	}

	public int deleteProfileImg(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("mypageMapper.deleteProfileImg", memNo);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		sqlSession.insert("mypageMapper.insertReview", r);
		int revNo = r.getRevNo();
		return revNo;
	}

	public int updateReviewStatus(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("mypageMapper.updateReviewStatus", r);
	}

	public int getFavListCount(SqlSessionTemplate sqlSession, Favorite fav) {
		return sqlSession.selectOne("mypageMapper.getFavListCount", fav);
	}

	public ArrayList<Favorite> selectFavActList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFavActList", id, rowBounds);
	}

	public ArrayList<Favorite> selectFavProList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFavProList", id, rowBounds);
	}
	
	public ArrayList<Favorite> selectFavStarList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFavStarList", id, rowBounds);
	}

	public int deleteFav(SqlSessionTemplate sqlSession, Favorite f) {
		return sqlSession.update("mypageMapper.deleteFav", f);
	}

	public int getReviewListCount(SqlSessionTemplate sqlSession, Review rev) {
		return sqlSession.selectOne("mypageMapper.getReviewListCount", rev);
	}

	public ArrayList<Review> selectRevActList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectRevActList", id, rowBounds);
	}
	
	public ArrayList<Review> selectRevProList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectRevProList", id, rowBounds);
	}

	public ArrayList<Image> selectRevDetailImg(SqlSessionTemplate sqlSession, int revNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectRevDetailImg", revNo);
	}

	public Review selectRevActDetail(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.selectOne("mypageMapper.selectRevActDetail", revNo);
	}
	
	public Review selectRevProDetail(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.selectOne("mypageMapper.selectRevProDetail", revNo);
	}

	public int updateRevAct(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("mypageMapper.updateRevAct", r);
	}

	public int changeImgLevel(SqlSessionTemplate sqlSession, RevImgChange ric) {
		return sqlSession.update("mypageMapper.changeImgLevel", ric);
	}

}
