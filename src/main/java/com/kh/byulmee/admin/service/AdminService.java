package com.kh.byulmee.admin.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.byulmee.banner.model.vo.Banner;
import com.kh.byulmee.board.model.vo.CustomerQna;
import com.kh.byulmee.board.model.vo.Notice;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.member.model.vo.Member;

@Service
public interface AdminService {

//	int getMemberListCount();
//	
//	ArrayList<Member> selectList(PageInfo pi);


	ArrayList<Member> selectMemberList(PageInfo pi, String id);

	int getMemberListCount(String id);

    void updateMemberLevelById(Map param);
    
    void updateMemberStatusById(Map param);
    
	int getNoticeListCount();
	
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	int getQnAListCount();

	ArrayList<CustomerQna> selectCusQnAList(PageInfo pi2);

	int insertBanner(Banner ba);

	int getBannerListCount();

	ArrayList<Banner> selectBannerList(PageInfo pi);

	void updateAdminBannerOpenById(Map param);




}
