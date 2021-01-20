package com.kh.byulmee.mypage.model.service;

import java.util.HashMap;

import com.kh.byulmee.member.model.vo.Member;

public interface MypageService {

	Member memberLogin(Member m);

	int updateMyInfo(Member m);

	int updateMyPwd(HashMap<String, String> map);

	int deleteMember(String id);

}
