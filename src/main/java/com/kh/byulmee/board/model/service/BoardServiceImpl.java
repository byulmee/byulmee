package com.kh.byulmee.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.board.model.dao.BoardDAO;
import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.Notice;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.board.model.vo.SearchCondition;

@Service("bService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;

	@Override
	public int getNoticeListCount() {
		return bDAO.getNoticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return bDAO.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return bDAO.insertNotice(sqlSession, n);
	}

	@Override
	public Notice selectNotice(int notNo) {
		return bDAO.selectNotice(sqlSession, notNo);
	}

	@Override
	public int updateNotice(Notice n) {
		return bDAO.updateNotice(sqlSession, n);
	}

	@Override
	public int updateNotCount(int notNo) {
		return bDAO.updateNotCount(sqlSession, notNo);
	}

	@Override
	public int noticeDelete(int notNo) {
		return bDAO.noticeDelete(sqlSession, notNo);
	}

	@Override
	public int getQnAListCount() {
		return bDAO.getQnAListCount(sqlSession);
	}

	@Override
	public ArrayList<CustomerQna> selectCusQnAList(PageInfo pi) {
		return bDAO.selectCusQnAList(sqlSession, pi);
	}

	@Override
	public int insertCusQna(CustomerQna c) {
		return bDAO.insertCusQna(sqlSession, c);
	}

	@Override
	public int updateCusCount(int cusqnaNo) {
		return bDAO.updateCusCount(sqlSession, cusqnaNo);
	}

	@Override
	public CustomerQna selectCusQnA(int cusqnaNo) {
		return bDAO.selectCusQnA(sqlSession, cusqnaNo);
	}

	@Override
	public int updateCusQna(CustomerQna c) {
		return bDAO.updateCusQna(sqlSession, c);
	}

	@Override
	public int cusQnaDelete(int cusqnaNo) {
		return bDAO.cusQnaDelete(sqlSession, cusqnaNo);
	}

	@Override
	public int getSearchNoticeListCount(String value) {
		return bDAO.getSearchNoticeListCount(sqlSession, value);
	}

	@Override
	public ArrayList<Notice> selectSearchNoticeList(String value, PageInfo pi) {
		return bDAO.selectSearchNoticeList(sqlSession, value, pi);
	}

	@Override
	public int getSearchCusListCount(SearchCondition sc) {
		return bDAO.getSearchCusListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<CustomerQna> selectSearchCusQnAList(SearchCondition sc, PageInfo pi) {
		return bDAO.selectSearchCusQnAList(sqlSession, sc, pi);
	}
}
