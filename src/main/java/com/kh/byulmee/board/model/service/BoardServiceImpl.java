package com.kh.byulmee.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.board.model.dao.BoardDAO;
import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.Notice;
import com.kh.byulmee.board.model.vo.PageInfo;

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
}
