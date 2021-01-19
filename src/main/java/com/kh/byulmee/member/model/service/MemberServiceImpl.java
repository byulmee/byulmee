package com.kh.byulmee.member.model.service;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.member.model.dao.MemberDAO;
import com.kh.byulmee.member.model.vo.Member;

/* by다혜: 회원 정보 추가, 업데이트, 조회 처리 Sevice */
@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public Member selectMember(String memId) {
		return mDAO.selectMember(sqlSession, memId);
	}
	@Override
	public int checkId(String memId) {
		return mDAO.checkId(sqlSession, memId);
	}

	@Override
	public int checkNickname(String nickname) {
		return mDAO.checkNickname(sqlSession, nickname);
	}
	
	@Override
	public int checkPhone(String memPhone) {
		return mDAO.checkPhone(sqlSession, memPhone);
	}
	
	@Override
	public int checkEmail(String email) {
		return mDAO.checkEmail(sqlSession, email);
	}

	@Override
	public String findIdWithPhone(String data) {
		JSONObject json = null;
		Member member = new Member();
		
		try {
			json = (JSONObject)new JSONParser().parse(data);
			
			member.setMemName((String)json.get("memName"));
			member.setMemPhone((String)json.get("memInfo"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(member);
		return mDAO.findIdWithPhone(sqlSession, member);
	}

	@Override
	public String findIdWithEmail(String data) {
		JSONObject json = null;
		Member member = new Member();
		
		try {
			json = (JSONObject)new JSONParser().parse(data);
			
			member.setMemName((String)json.get("memName"));
			member.setMemEmail((String)json.get("memInfo"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return mDAO.findIdWithEmail(sqlSession, member);
	}
}
