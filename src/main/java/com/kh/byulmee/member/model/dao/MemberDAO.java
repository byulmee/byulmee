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
	
	public int checkPhone(SqlSessionTemplate sqlSession, String memPhone) {
		return sqlSession.selectOne("memberMapper.checkPhone", memPhone);
	}

	public int checkNickname(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.checkNickname", nickname);
	}

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	public String findIdWithPhone(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.findIdWithPhone", member);
	}
	
	public String findIdWithEmail(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.findIdWithEmail", member);
	}

	public int resetPwd(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.resetPwd", member);
	}

	public int CheckIdWithEmail(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.CheckIdWithEmail", member);
	}
	
	public int CheckIdWithPhone(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.CheckIdWithPhone", member);
	}
  
  public Member selectActivityWriter(SqlSessionTemplate sqlSession, int acId) {
		return sqlSession.selectOne("memberMapper.selectActivityWriter", acId);
	}

public Member selectMemberWithNo(SqlSessionTemplate sqlSession, int memNo) {
	return sqlSession.selectOne("memberMapper.selectMemberWithNo", memNo);
}	
}
