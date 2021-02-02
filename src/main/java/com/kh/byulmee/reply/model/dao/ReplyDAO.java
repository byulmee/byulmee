package com.kh.byulmee.reply.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.reply.model.vo.Reply;

@Repository("rDAO")
public class ReplyDAO {

	public Reply selectQnaReply(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.selectOne("replyMapper.selectQnaReply", qnaNo);
	}

	public Reply selectCusQnaReply(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.selectOne("replyMapper.selectCusQnaReply", reply);
	}

	public int cusReplyInsert(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("replyMapper.cusReplyInsert", r);
	}

	public int updateCusReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("replyMapper.updateCusReply", r);
	}

	public int deleteCusReply(SqlSessionTemplate sqlSession, int repNo) {
		return sqlSession.update("replyMapper.deleteCusReply", repNo);
	}

	public Reply selectSalQna(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.selectOne("replyMapper.selectSalQna", reply);
	}

	public int updateSalReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("replyMapper.updateSalReply", r);
	}

	public int deleteSalReply(SqlSessionTemplate sqlSession, int repNo) {
		return sqlSession.update("replyMapper.deleteSalReply", repNo);
	}

}
