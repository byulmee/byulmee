package com.kh.byulmee.member.model.service;

import com.kh.byulmee.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member selectMember(String memId);

	int checkId(String memId);
	
	int checkNickname(String nickname);
	
	int checkPhone(String memPhone);
	
	int checkEmail(String memEmail);

	String findIdWithPhone(String data);
	
	String findIdWithEmail(String data);
	
	int CheckIdWithPhone(Member member);
	
	int CheckIdWithEmail(Member member);
	
	String resetPwd(Member member);
  
  Member selectActivityWriter(int acId);
}
