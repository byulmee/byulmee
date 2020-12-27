package com.kh.byulmee.order.model.vo;

import java.sql.Date;

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
	
	public Order() {}
	
	public Order(int ordNo, String memId, int ordCount, Date ordDate, String ordName, String ordPhone, int ordPostcode,
			String ordBasicaddr, String ordDetailaddr, String ordRequest, int ordPayno, int ordPay, int ordPayWay) {
		super();
		this.ordNo = ordNo;
		this.memId = memId;
		this.ordCount = ordCount;
		this.ordDate = ordDate;
		this.ordName = ordName;
		this.ordPhone = ordPhone;
		this.ordPostcode = ordPostcode;
		this.ordBasicaddr = ordBasicaddr;
		this.ordDetailaddr = ordDetailaddr;
		this.ordRequest = ordRequest;
		this.ordPayno = ordPayno;
		this.ordPay = ordPay;
		this.ordPayWay = ordPayWay;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getOrdCount() {
		return ordCount;
	}

	public void setOrdCount(int ordCount) {
		this.ordCount = ordCount;
	}

	public Date getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}

	public String getOrdName() {
		return ordName;
	}

	public void setOrdName(String ordName) {
		this.ordName = ordName;
	}

	public String getOrdPhone() {
		return ordPhone;
	}

	public void setOrdPhone(String ordPhone) {
		this.ordPhone = ordPhone;
	}

	public int getOrdPostcode() {
		return ordPostcode;
	}

	public void setOrdPostcode(int ordPostcode) {
		this.ordPostcode = ordPostcode;
	}

	public String getOrdBasicaddr() {
		return ordBasicaddr;
	}

	public void setOrdBasicaddr(String ordBasicaddr) {
		this.ordBasicaddr = ordBasicaddr;
	}

	public String getOrdDetailaddr() {
		return ordDetailaddr;
	}

	public void setOrdDetailaddr(String ordDetailaddr) {
		this.ordDetailaddr = ordDetailaddr;
	}

	public String getOrdRequest() {
		return ordRequest;
	}

	public void setOrdRequest(String ordRequest) {
		this.ordRequest = ordRequest;
	}

	public int getOrdPayno() {
		return ordPayno;
	}

	public void setOrdPayno(int ordPayno) {
		this.ordPayno = ordPayno;
	}

	public int getOrdPay() {
		return ordPay;
	}

	public void setOrdPay(int ordPay) {
		this.ordPay = ordPay;
	}

	public int getOrdPayWay() {
		return ordPayWay;
	}

	public void setOrdPayWay(int ordPayWay) {
		this.ordPayWay = ordPayWay;
	}

	@Override
	public String toString() {
		return "Order [ordNo=" + ordNo + ", memId=" + memId + ", ordCount=" + ordCount + ", ordDate=" + ordDate
				+ ", ordName=" + ordName + ", ordPhone=" + ordPhone + ", ordPostcode=" + ordPostcode + ", ordBasicaddr="
				+ ordBasicaddr + ", ordDetailaddr=" + ordDetailaddr + ", ordRequest=" + ordRequest + ", ordPayno="
				+ ordPayno + ", ordPay=" + ordPay + ", ordPayWay=" + ordPayWay + "]";
	}
}