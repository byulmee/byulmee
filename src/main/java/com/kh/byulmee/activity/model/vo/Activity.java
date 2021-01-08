package com.kh.byulmee.activity.model.vo;

import java.sql.Date;

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
	
	public Activity() {}

	public Activity(int actNo, String memId, String actPhone, Date actStartday, Date actEndday, String actPlace,
			int actPeople, Date actRequestend, int actCategory, String actTitle, int actPrice, String actUrl,
			String actContent, String actGuide, int actCount, Date actDate, String actStatus) {
		super();
		this.actNo = actNo;
		this.memId = memId;
		this.actPhone = actPhone;
		this.actStartday = actStartday;
		this.actEndday = actEndday;
		this.actPlace = actPlace;
		this.actPeople = actPeople;
		this.actRequestend = actRequestend;
		this.actCategory = actCategory;
		this.actTitle = actTitle;
		this.actPrice = actPrice;
		this.actUrl = actUrl;
		this.actContent = actContent;
		this.actGuide = actGuide;
		this.actCount = actCount;
		this.actDate = actDate;
		this.actStatus = actStatus;
	}

	public int getActNo() {
		return actNo;
	}

	public void setActNo(int actNo) {
		this.actNo = actNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getActPhone() {
		return actPhone;
	}

	public void setActPhone(String actPhone) {
		this.actPhone = actPhone;
	}

	public Date getActStartday() {
		return actStartday;
	}

	public void setActStartday(Date actStartday) {
		this.actStartday = actStartday;
	}

	public Date getActEndday() {
		return actEndday;
	}

	public void setActEndday(Date actEndday) {
		this.actEndday = actEndday;
	}

	public String getActPlace() {
		return actPlace;
	}

	public void setActPlace(String actPlace) {
		this.actPlace = actPlace;
	}

	public int getActPeople() {
		return actPeople;
	}

	public void setActPeople(int actPeople) {
		this.actPeople = actPeople;
	}

	public Date getActRequestend() {
		return actRequestend;
	}

	public void setActRequestend(Date actRequestend) {
		this.actRequestend = actRequestend;
	}

	public int getActCategory() {
		return actCategory;
	}

	public void setActCategory(int actCategory) {
		this.actCategory = actCategory;
	}

	public String getActTitle() {
		return actTitle;
	}

	public void setActTitle(String actTitle) {
		this.actTitle = actTitle;
	}

	public int getActPrice() {
		return actPrice;
	}

	public void setActPrice(int actPrice) {
		this.actPrice = actPrice;
	}

	public String getActUrl() {
		return actUrl;
	}

	public void setActUrl(String actUrl) {
		this.actUrl = actUrl;
	}

	public String getActContent() {
		return actContent;
	}

	public void setActContent(String actContent) {
		this.actContent = actContent;
	}

	public String getActGuide() {
		return actGuide;
	}

	public void setActGuide(String actGuide) {
		this.actGuide = actGuide;
	}

	public int getActCount() {
		return actCount;
	}

	public void setActCount(int actCount) {
		this.actCount = actCount;
	}

	public Date getActDate() {
		return actDate;
	}

	public void setActDate(Date actDate) {
		this.actDate = actDate;
	}

	public String getActStatus() {
		return actStatus;
	}

	public void setActStatus(String actStatus) {
		this.actStatus = actStatus;
	}

	@Override
	public String toString() {
		return "Activity [actNo=" + actNo + ", memId=" + memId + ", actPhone=" + actPhone + ", actStartday="
				+ actStartday + ", actEndday=" + actEndday + ", actPlace=" + actPlace + ", actPeople=" + actPeople
				+ ", actRequestend=" + actRequestend + ", actCategory=" + actCategory + ", actTitle=" + actTitle
				+ ", actPrice=" + actPrice + ", actUrl=" + actUrl + ", actContent=" + actContent + ", actGuide="
				+ actGuide + ", actCount=" + actCount + ", actDate=" + actDate + ", actStatus=" + actStatus + "]";
	}
	
	
}