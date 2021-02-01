package com.kh.byulmee.activity.model.service;

import java.util.ArrayList;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.member.model.vo.Member;


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

	int getUserListCount(String memId);

	ArrayList<Activity> selectUserList(String memId, PageInfo pi);


}
