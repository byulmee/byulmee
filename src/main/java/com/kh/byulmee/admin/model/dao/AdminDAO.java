package com.kh.byulmee.admin.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.banner.model.vo.Banner;
import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.Notice;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.vo.Member;

@Repository("abDAO")
public class AdminDAO {

@Autowired
SqlSessionTemplate sqlSession;

public int getMemberListCount() {
return sqlSession.selectOne("adminMapper.getMemberListCount");

}

public ArrayList<Member> selectMemberList(PageInfo pi, String id) {
int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", id , rowBounds);
}

	public void updateMemberLevel(Map param) {
		sqlSession.update("adminMapper.updateMemberLevel", param);
	}
	
	public void updateMemberStatus(Map param) {
		sqlSession.update("adminMapper.updateMemberStatus", param);
	}
	
	public int getNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getNoticeListCount");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeList", null, rowBounds);
	}
	public int getQnAListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getQnAListCount");
	}

	public ArrayList<CustomerQna> selectCusQnAList(SqlSessionTemplate sqlSession, PageInfo pi2) {
		int offset = (pi2.getCurrentPage() - 1) * pi2.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi2.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectCusQnAList", null, rowBounds);
	}

	public int insertBanner(SqlSessionTemplate sqlSession, Banner ba) {
		
		return sqlSession.insert("adminMapper.insertBanner", ba);
	}

	public ArrayList<Banner> selectBannerList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBannerList", null, rowBounds);
	}

	public void updateBannerOpen(Map param) {
		sqlSession.update("adminMapper.updateBannerOpen", param);
	}
	
}