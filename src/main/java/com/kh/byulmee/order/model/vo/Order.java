package com.kh.byulmee.order.model.vo;

import java.sql.Date;

import com.kh.byulmee.activity.model.vo.Activity;

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
	private String ordId;
	private int ordCount;
	private Date ordDate;
	private String ordName;
	private String ordPhone;
	private String ordPostcode;
	private String ordBasicaddr;
	private String ordDetailaddr;
	private String ordRequest;
	private int ordPayno;
	private int ordPay;
	private int ordPayWay;
	private String ordStatus;
	private int ordRefcode;
	private int ordRefno;
	
	private Activity activity;
}