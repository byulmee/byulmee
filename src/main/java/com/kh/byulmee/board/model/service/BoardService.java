package com.kh.byulmee.board.model.service;

import java.util.ArrayList;

import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.Notice;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.board.model.vo.SearchCondition;

public interface BoardService {

	int getNoticeListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi);

	int insertNotice(Notice n);

	Notice selectNotice(int notNo);

	int updateNotice(Notice n);

	int updateNotCount(int notNo);

	int noticeDelete(int notNo);

	int getQnAListCount();

	ArrayList<CustomerQna> selectCusQnAList(PageInfo pi);

	int insertCusQna(CustomerQna c);

	int updateCusCount(int cusqnaNo);

	CustomerQna selectCusQnA(int cusqnaNo);

	int updateCusQna(CustomerQna c);

	int cusQnaDelete(int cusqnaNo);

	int getSearchNoticeListCount(String value);

	ArrayList<Notice> selectSearchNoticeList(String value, PageInfo pi);

	int getSearchCusListCount(SearchCondition sc);

	ArrayList<CustomerQna> selectSearchCusQnAList(SearchCondition sc, PageInfo pi);

}
