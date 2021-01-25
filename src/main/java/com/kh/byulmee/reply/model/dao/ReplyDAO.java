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


}
