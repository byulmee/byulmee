package com.kh.byulmee.activity.model.service;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.member.model.vo.Member;

public interface ActivityService {
	
	int insertActivity(Activity a);

	Activity selectActivity(int acId);

}
