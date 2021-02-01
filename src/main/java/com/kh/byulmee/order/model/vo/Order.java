package com.kh.byulmee.order.model.vo;

import java.sql.Date;

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
public class Order {
	private int ordNo;
	private String memId;
	private int ordCount;
	private Date ordDate;
	private String ordName;
	private String ordPhone;
	private String ordPostcode;
	private String ordBasicaddr;
	private String ordDetailaddr;
	private String ordRequest;
	private String ordPayno;
	private int ordPay;
	private int ordPayWay;
	private String ordReview;
	private String ordStatus;
	private int ordRefcode;
	private int ordRefno;
	private String ordStarcode;
	private String ordParcelcode;
	private int ordRePay;
	
	private Product product;
	private Activity activity;
	private Member member;
	private Image image;
	private Product product;
}