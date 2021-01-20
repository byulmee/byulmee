package com.kh.byulmee.mypage.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.mypage.model.dao.MypageDAO;

@Service("mpService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO mpDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member memberLogin(Member m) {
		return mpDAO.selectMember(sqlSession, m);
	}
	
	@Override
	public int updateMyInfo(Member m) {
		return mpDAO.updateMyInfo(sqlSession, m);
	}

	@Override
	public int updateMyPwd(HashMap<String, String> map) {
		return mpDAO.updateMyPwd(sqlSession, map);
	}

	@Override
	public int deleteMember(String id) {
		return mpDAO.deleteMember(sqlSession, id);
	}

}
