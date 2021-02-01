package com.kh.byulmee.member.model.service;

import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.member.model.dao.MemberDAO;
import com.kh.byulmee.member.model.exception.MemberException;
import com.kh.byulmee.member.model.vo.Member;

/* by다혜: 회원 정보 추가, 업데이트, 조회 처리 Sevice */
@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	
	//회원 가입
	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}
	
	//회원 조회
	@Override
	public Member selectMember(String memId) {
		return mDAO.selectMember(sqlSession, memId);
	}
	
	//아이디 중복 체크
	@Override
	public int checkId(String memId) {
		return mDAO.checkId(sqlSession, memId);
	}

	//닉네임 중복 체크
	@Override
	public int checkNickname(String nickname) {
		return mDAO.checkNickname(sqlSession, nickname);
	}
	
	//휴대전화 중복 체크
	@Override
	public int checkPhone(String memPhone) {
		return mDAO.checkPhone(sqlSession, memPhone);
	}
	
	//이메일 중복 체크
	@Override
	public int checkEmail(String memEmail) {
		return mDAO.checkEmail(sqlSession, memEmail);
	}

	//휴대전화 번호로 아이디 찾기
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

		return mDAO.findIdWithPhone(sqlSession, member);
	}

	//이메일로 아이디 찾기
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
	
	//아이디와 이메일로 회원 확인
	@Override
	public int CheckIdWithEmail(Member member) {
		return mDAO.CheckIdWithEmail(sqlSession, member);
	}
	
	//아이디와 휴대전화로 회원 확인
	@Override
	public int CheckIdWithPhone(Member member) {
		return mDAO.CheckIdWithPhone(sqlSession, member);
	}
	
	//비밀번호 초기화
	@Override
	public String resetPwd(Member member) {
		
		Member checkMemExisted = mDAO.selectMember(sqlSession, member.getMemId());
		
		//해당 유저가 존재하는지 검사 후 비밀번호 변경
		if(checkMemExisted != null) {
			if(mDAO.resetPwd(sqlSession, member) > 0) {
				return "success";
			} else {
				throw new MemberException("비밀번호 변경에 실패했습니다.\n관리자에게 문의해주세요.");
			}
		} else {
			return "user_not_found";
		}
	}

	@Override
	public Member selectActivityWriter(int acId) {
		return mDAO.selectActivityWriter(sqlSession, acId);
	}
	
	@Override
	public Member selectProductWriter(int pdId) {
		return mDAO.selectProductWriter(sqlSession, pdId);
	}
	
	//검색 키워드와 일치하는 전체 스타 수
	@Override
	public int getStarSearchListCount(String[] keywords) {
		return mDAO.getStarSearchListCount(sqlSession, keywords);
	}

	@Override
	public ArrayList<Activity> getStarSearchResult(PageInfo pi, String[] keywords) {
		return mDAO.getStarSearchResult(sqlSession, pi, keywords);
	}

}
