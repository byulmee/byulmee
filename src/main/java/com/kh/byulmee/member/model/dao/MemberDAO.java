package com.kh.byulmee.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.member.model.vo.Member;

/* by다혜: 회원 정보 처리 DAO */
@Repository("mDAO")
public class MemberDAO {

	public int insertMember(SqlSession sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.selectMember", memId);
	}
	
	public int checkId(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.checkId", memId);
	}

	public int checkNickname(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.checkNickname", nickname);
	}

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}
	
	public Member selectActivityWriter(SqlSessionTemplate sqlSession, int acId) {
		return sqlSession.selectOne("memberMapper.selectActivityWriter", acId);
	}	
}
