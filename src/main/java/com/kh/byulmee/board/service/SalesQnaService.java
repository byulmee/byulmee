package com.kh.byulmee.board.service;

import java.util.ArrayList;

import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.board.model.vo.SalesQna;

public interface SalesQnaService {

	ArrayList<SalesQna> selectQnaList(int acId);

	ArrayList<SalesQna> selectQnaExceptList(int acId);

	int insertQna(SalesQna sq);

	ArrayList<SalesQna> selectProductQnaList(int pdId);

	ArrayList<SalesQna> selectProductQnaExceptList(int pdId);

	int insertProductQna(SalesQna sq);
	
	int getListCount(String memId);

	ArrayList<SalesQna> selectSalQnaList(PageInfo pi, String memId);

	SalesQna selectSalQna(int salqnaNo);

	int updateSalstatus(int repRefno);

	int unUpdateSalstatus(int repRefno);

	int salQnaDelete(int salqnaNo);

	int salQnaUpdate(SalesQna s);
}
