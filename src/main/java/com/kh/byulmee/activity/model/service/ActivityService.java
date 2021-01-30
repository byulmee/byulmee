package com.kh.byulmee.activity.model.service;

import java.util.ArrayList;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.board.model.vo.PageInfo;
import com.kh.byulmee.member.model.vo.Member;


public interface ActivityService {
	
	int insertActivity(Activity a);


	int getListCount();

	ArrayList<Activity> selectList(PageInfo pi);

	Activity selectAct(int actNo);

	int actUnableUpdate(int actNo);

	int actAbleUpdate(int actNo);

	int deleteAct(int actNo);

	int updateActivity(Activity a);

	Activity selectActivity(int acId);

	int selectOrderSum(int acId);


}
