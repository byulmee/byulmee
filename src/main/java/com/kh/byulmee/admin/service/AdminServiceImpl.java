package com.kh.byulmee.admin.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.admin.model.dao.AdminDAO;
import com.kh.byulmee.banner.model.vo.Banner;
import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.Notice;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.vo.Member;

@Service("abService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO abDAO;
	
	@Override
	public int getMemberListCount(String id) {
	return abDAO.getMemberListCount();
	}
	
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi, String id) {
		return abDAO.selectMemberList(pi, id);
	}

	@Override
	public void updateMemberLevelById(Map param) {
		 abDAO.updateMemberLevel(param);
	}

	@Override
	public void updateMemberStatusById(Map param) {
		 abDAO.updateMemberStatus(param);
	}
	
	@Override
	public int getNoticeListCount() {
		return abDAO.getNoticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return abDAO.selectNoticeList(sqlSession, pi);
	}
	
	@Override
	public int getQnAListCount() {
		return abDAO.getQnAListCount(sqlSession);
	}

	@Override
	public ArrayList<CustomerQna> selectCusQnAList(PageInfo pi2) {
		return abDAO.selectCusQnAList(sqlSession, pi2);
	}
	
	@Override
	public int insertBanner(Banner ba) {
		
		return abDAO.insertBanner(sqlSession, ba);
	}
	@Override
	public int getBannerListCount() {
		return abDAO.getQnAListCount(sqlSession);
	}

	@Override
	public ArrayList<Banner> selectBannerList(PageInfo pi) {
		return abDAO.selectBannerList(sqlSession, pi);
	}
	
	@Override
	public void updateAdminBannerOpenById(Map param) {
		 abDAO.updateBannerOpen(param);
	}
}