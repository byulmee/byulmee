package com.kh.byulmee.member.model.service;

import com.kh.byulmee.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member selectMember(String memId);

}
