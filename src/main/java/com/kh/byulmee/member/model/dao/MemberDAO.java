package com.kh.byulmee.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public int insertMember(SqlSession sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.selectMember", memId);
	}
	
}
