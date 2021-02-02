package com.kh.byulmee.activity.model.service;

import java.util.ArrayList;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;


public interface ActivityService {
	
	int insertActivity(Activity a);

	int getListCount(String memId);

	ArrayList<Activity> selectList(String memId, PageInfo pi);

	Activity selectAct(int actNo);

	int actUnableUpdate(int actNo);

	int actAbleUpdate(int actNo);

	int deleteAct(int actNo);

	int updateActivity(Activity a);

	Activity selectActivity(int acId);

	int selectOrderSum(int acId);
	
	int getUserListCount(String memId);

	ArrayList<Activity> selectUserList(String memId, PageInfo pi);

	int getActSearchListCount(String[] keywords);
	
	ArrayList<Activity> getActSearchResult(PageInfo pi, String[] keywords);

	ArrayList<Activity> getPopularActList();

	ArrayList<Activity> getNearEndDateActList();
}
