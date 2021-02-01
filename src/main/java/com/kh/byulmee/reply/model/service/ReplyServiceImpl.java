package com.kh.byulmee.reply.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.reply.model.dao.ReplyDAO;
import com.kh.byulmee.reply.model.vo.Reply;

@Service("rService")
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReplyDAO rDAO;

	@Override
	public Reply getQnaReply(int qnaNo) {
		return rDAO.selectQnaReply(sqlSession,qnaNo);
	}

	@Override
	public Reply selectCusQnaReply(Reply reply) {
		return rDAO.selectCusQnaReply(sqlSession ,reply);
	}

	@Override
	public int cusReplyInsert(Reply r) {
		return rDAO.cusReplyInsert(sqlSession, r);
	}

	@Override
	public int updateCusReply(Reply r) {
		return rDAO.updateCusReply(sqlSession, r);
	}

	@Override
	public int deleteCusReply(int repNo) {
		return rDAO.deleteCusReply(sqlSession, repNo);
	}

	@Override
	public Reply selectSalQna(Reply reply) {
		return rDAO.selectSalQna(sqlSession, reply);
	}

	@Override
	public int updateSalReply(Reply r) {
		return rDAO.updateSalReply(sqlSession, r);
	}

	@Override
	public int deleteSalReply(int repNo) {
		return rDAO.deleteSalReply(sqlSession, repNo);
	}
}
