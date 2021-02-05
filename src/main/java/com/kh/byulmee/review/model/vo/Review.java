package com.kh.byulmee.review.model.vo;

import java.sql.Date;
import java.util.List;

import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.member.model.vo.Member;
import com.kh.byulmee.product.model.vo.Product;

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
public class Review {
	private int revNo;
	private String memId;
	private double revRating;
	private double revLastRating;
	private String revContent;
	private Date revDate;
	private String revStatus;
	private int revRefcode;
	private int revRefno;
	private int ordNo;
	private Image img;
	private Activity activity;
	private Product product;
	private Member member;
	private List<Image> image;
}