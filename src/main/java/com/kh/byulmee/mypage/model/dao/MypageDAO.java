package com.kh.byulmee.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.vo.Member;
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

	public int getOrderListCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("mypageMapper.getOrderListCount", id);
	}

	public ArrayList<Order> selectOrderList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectOrderList", id, rowBounds);
	}

	// ajax 부분
	public ArrayList<Order> selectDetailList(SqlSessionTemplate sqlSession, int ordNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectDetailList", ordNo);
	}

	public int insertProfileImage(SqlSessionTemplate sqlSession, Image i) {
		return sqlSession.insert("mypageMapper.insertProfileImage", i);
	}

	public ArrayList<Image> selectProfileImg(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectProfileImg", memNo);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		sqlSession.insert("mypageMapper.insertReview", r);
		int revNo = r.getRevNo();
		return revNo;
	}

	public int updateReviewStatus(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("mypageMapper.updateReviewStatus", r);
	}
}
