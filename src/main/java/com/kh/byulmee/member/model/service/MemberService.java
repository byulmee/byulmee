package com.kh.byulmee.member.model.service;

import java.util.ArrayList;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member selectMember(String memId);

	int checkId(String memId);
	
	int checkNickname(String memNickname);
	
	int checkPhone(String memPhone);
	
	int checkEmail(String memEmail);

	String findIdWithPhone(String data);
	
	String findIdWithEmail(String data);
	
	int CheckIdWithPhone(Member member);
	
	int CheckIdWithEmail(Member member);
	
	String resetPwd(Member member);
  
	Member selectActivityWriter(int acId);

	int getStarSearchListCount(String[] keywords);

	ArrayList<Activity> getStarSearchResult(PageInfo starListPi, String[] keywords);

	Member selectMemberWithNo(int memNo);

	Member selectProductWriter(int pdId);
}
