package com.kh.byulmee.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.Notice;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.board.model.vo.SearchCondition;

@Repository("bDAO")
public class BoardDAO {

	public int getNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getNoticeListCount");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoticeList", null, rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("boardMapper.insertNotice", n);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int notNo) {
		return sqlSession.selectOne("boardMapper.selectNotice", notNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("boardMapper.updateNotice", n);
	}

	public int updateNotCount(SqlSessionTemplate sqlSession, int notNo) {
		return sqlSession.update("boardMapper.updateNotCount", notNo);
	}

	public int noticeDelete(SqlSessionTemplate sqlSession, int notNo) {
		return sqlSession.update("boardMapper.noticeDelete", notNo);
	}

	public int getQnAListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getQnAListCount");
	}

	public ArrayList<CustomerQna> selectCusQnAList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectCusQnAList", null, rowBounds);
	}

	public int insertCusQna(SqlSessionTemplate sqlSession, CustomerQna c) {
		return sqlSession.insert("boardMapper.insertCusQna", c);
	}

	public int updateCusCount(SqlSessionTemplate sqlSession, int cusqnaNo) {
		return sqlSession.update("boardMapper.updateCusCount", cusqnaNo);
	}

	public CustomerQna selectCusQnA(SqlSessionTemplate sqlSession, int cusqnaNo) {
		return sqlSession.selectOne("boardMapper.selectCusQnA", cusqnaNo);
	}

	public int updateCusQna(SqlSessionTemplate sqlSession, CustomerQna c) {
		return sqlSession.update("boardMapper.updateCusQna", c);
	}

	public int cusQnaDelete(SqlSessionTemplate sqlSession, int cusqnaNo) {
		return sqlSession.update("boardMapper.cusQnaDelete", cusqnaNo);
	}

	public int getSearchNoticeListCount(SqlSessionTemplate sqlSession, String value) {
		return sqlSession.selectOne("boardMapper.getSearchNoticeListCount", value);
	}

	public ArrayList<Notice> selectSearchNoticeList(SqlSessionTemplate sqlSession, String value, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchNoticeList", value, rowBounds);
	}

	public int getSearchCusListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("boardMapper.getSearchCusListCount", sc);
	}

	public ArrayList<CustomerQna> selectSearchCusQnAList(SqlSessionTemplate sqlSession, SearchCondition sc,
			PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchCusQnAList", sc, rowBounds);
	}

}
