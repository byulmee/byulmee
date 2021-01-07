package com.kh.byulmee.order.model.vo;

import java.sql.Date;

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
	private int ordPostcode;
	private String ordBasicaddr;
	private String ordDetailaddr;
	private String ordRequest;
	private int ordPayno;
	private int ordPay;
	private int ordPayWay;
}