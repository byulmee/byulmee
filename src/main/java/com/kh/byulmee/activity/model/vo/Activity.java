package com.kh.byulmee.activity.model.vo;

import java.sql.Date;

import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Activity {
	
	private int actNo;
	private String memId;
	private String actPhone;
	private Date actStartday;
	private Date actEndday;
	private String actPlace;
	private int actPeople;
	private Date actRequestend;
	private int actCategory;
	private String actTitle;
	private int actPrice;
	private String actUrl;
	private String actContent;
	private String actGuide;
	private int actCount;
	private Date actDate;
	private String actStatus;
	private double actTotalScore;
	private int actReviewCnt;
	private double actRating;
	private Member member;
	private Image image;
}