package com.kh.byulmee.member.model.service;

import com.kh.byulmee.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member selectMember(String memId);

	int checkId(String memId);
	
	int checkNickname(String nickname);
	
	

	int checkEmail(String email);

	String findIdWithPhone(String data);
	
	String findIdWithEmail(String data);

	int checkPhone(String memPhone);
}
