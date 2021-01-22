package com.kh.byulmee.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.order.model.vo.Order;

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
}
