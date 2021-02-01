package com.kh.byulmee.reply.model.service;

import java.util.ArrayList;

import com.kh.byulmee.reply.model.vo.Reply;

public interface ReplyService {

	Reply getQnaReply(int qnaNo);

	Reply selectCusQnaReply(Reply reply);

	int cusReplyInsert(Reply r);

	int updateCusReply(Reply r);

	int deleteCusReply(int repNo);

	Reply selectSalQna(Reply reply);

	int updateSalReply(Reply r);

	int deleteSalReply(int repNo);
}
