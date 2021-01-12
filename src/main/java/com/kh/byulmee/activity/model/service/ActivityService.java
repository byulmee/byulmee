package com.kh.byulmee.activity.model.service;

import com.kh.byulmee.activity.model.vo.Activity;

public interface ActivityService {
	
	int insertActivity(Activity a);

	Activity selectActivity(int acId);

}
