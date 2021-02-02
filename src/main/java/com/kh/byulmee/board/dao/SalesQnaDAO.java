package com.kh.byulmee.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.board.model.vo.PageInfo;
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
		
	public int getListCount(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("salesQnaMapper.getListCount", memId);
	}

	public ArrayList<SalesQna> selectSalQnaList(SqlSessionTemplate sqlSession, PageInfo pi, String memId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		 
		return (ArrayList)sqlSession.selectList("salesQnaMapper.selectSalQnaList", memId, rowBounds);
	}

	public SalesQna selectSalQna(SqlSessionTemplate sqlSession, int salqnaNo) {
		return sqlSession.selectOne("salesQnaMapper.selectSalQna", salqnaNo);
	}

	public int updateSalstatus(SqlSessionTemplate sqlSession, int repRefno) {
		return sqlSession.update("salesQnaMapper.updateSalstatus", repRefno);
	}

	public int unUpdateSalstatus(SqlSessionTemplate sqlSession, int repRefno) {
		return sqlSession.update("salesQnaMapper.unUpdateSalstatus", repRefno);
	}

	public int salQnaDelete(SqlSessionTemplate sqlSession, int salqnaNo) {
		return sqlSession.update("salesQnaMapper.salQnaDelete", salqnaNo);
	}

	public int salQnaUpdate(SqlSessionTemplate sqlSession, SalesQna s) {
		return sqlSession.update("salesQnaMapper.salQnaUpdate", s);
	}

}
