package com.kh.byulmee.board.service;

import java.util.ArrayList;

import com.kh.byulmee.board.model.vo.SalesQna;

public interface SalesQnaService {

	ArrayList<SalesQna> selectQnaList(int acId);

	ArrayList<SalesQna> selectQnaExceptList(int acId);

	int insertQna(SalesQna sq);


}
