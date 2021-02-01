package com.kh.byulmee.board.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.board.model.vo.SalesQna;

@Repository
public class SalesQnaDAO {

	public ArrayList<SalesQna> selectQnaList(SqlSessionTemplate sqlSession, int acId) {
		return (ArrayList)sqlSession.selectList("salesQnaMapper.selectQnaList", acId);
	}

	public ArrayList<SalesQna> selectQnaExceptList(SqlSessionTemplate sqlSession, int acId) {
		return (ArrayList)sqlSession.selectList("salesQnaMapper.selectQnaExceptList", acId);
	}

	public int insertQna(SqlSessionTemplate sqlSession, SalesQna sq) {
		return sqlSession.insert("salesQnaMapper.insertQna", sq);
	}

	public ArrayList<SalesQna> selectProductQnaList(SqlSessionTemplate sqlSession, int pdId) {
		return (ArrayList)sqlSession.selectList("salesQnaMapper.selectProductQnaList", pdId);
	}

	public ArrayList<SalesQna> selectProductQnaExceptList(SqlSessionTemplate sqlSession, int pdId) {
		return (ArrayList)sqlSession.selectList("salesQnaMapper.selectProductQnaExceptList", pdId);
	}

	public int insertProductQna(SqlSessionTemplate sqlSession, SalesQna sq) {
		return sqlSession.insert("salesQnaMapper.insertProductQna", sq);
	}

}
