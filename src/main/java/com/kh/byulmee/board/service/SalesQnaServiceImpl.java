package com.kh.byulmee.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.board.dao.SalesQnaDAO;
import com.kh.byulmee.board.model.vo.PageInfo;
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

	@Override
	public ArrayList<SalesQna> selectQnaExceptList(int acId) {
		return sqDAO.selectQnaExceptList(sqlSession, acId);
	}

	@Override
	public int insertQna(SalesQna sq) {
		return sqDAO.insertQna(sqlSession, sq);
	}

	@Override
	public ArrayList<SalesQna> selectProductQnaList(int pdId) {
		return sqDAO.selectProductQnaList(sqlSession, pdId);
	}

	@Override
	public ArrayList<SalesQna> selectProductQnaExceptList(int pdId) {
		return sqDAO.selectProductQnaExceptList(sqlSession, pdId);
	}

	@Override
	public int insertProductQna(SalesQna sq) {
		return sqDAO.insertProductQna(sqlSession, sq);
<<<<<<< HEAD
	}
	
	@Override
=======
  }
  
>>>>>>> master
	public int getListCount(String memId) {
		return sqDAO.getListCount(sqlSession, memId);
	}

	@Override
	public ArrayList<SalesQna> selectSalQnaList(PageInfo pi, String memId) {
		return sqDAO.selectSalQnaList(sqlSession, pi, memId);
	}

	@Override
	public SalesQna selectSalQna(int salqnaNo) {
		return sqDAO.selectSalQna(sqlSession, salqnaNo);
	}

	@Override
	public int updateSalstatus(int repRefno) {
		return sqDAO.updateSalstatus(sqlSession, repRefno);
	}

	@Override
	public int unUpdateSalstatus(int repRefno) {
		return sqDAO.unUpdateSalstatus(sqlSession, repRefno);
	}

	@Override
	public int salQnaDelete(int salqnaNo) {
		return sqDAO.salQnaDelete(sqlSession, salqnaNo);
	}

	@Override
	public int salQnaUpdate(SalesQna s) {
		return sqDAO.salQnaUpdate(sqlSession, s);
	}


}
