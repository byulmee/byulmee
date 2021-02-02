package com.kh.byulmee.product.model.vo;

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
public class Product {
	private int proNo;
	private String memId;
	private int proCharge;
	private int proStock;
	private int proMaximum;
	private int proCategory;
	private String proTitle;
	private int proPrice;
	private String proUrl;
	private String proContent;
	private String proGuide;
	private int proCount;
	private Date proDate;
	private String proStatus;
	private double proTotalScore;
	private int proReviewCnt;
	private double proRating;
	private Member member;
	private Image image;
}