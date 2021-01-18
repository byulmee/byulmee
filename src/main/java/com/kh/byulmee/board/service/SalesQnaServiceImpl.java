package com.kh.byulmee.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.board.dao.SalesQnaDAO;
import com.kh.byulmee.board.model.vo.SalesQna;


@Service("sqService")
public class SalesQnaServiceImpl implements SalesQnaService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SalesQnaDAO sqDAO;

	@Override
	public ArrayList<SalesQna> selectQnaList(int acId) {
		return sqDAO.selectQnaList(sqlSession, acId);
	}	

}
