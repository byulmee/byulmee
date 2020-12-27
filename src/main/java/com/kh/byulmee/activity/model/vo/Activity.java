package com.kh.byulmee.activity.model.vo;

import java.sql.Date;

public class Activity {
	private int memId;
	private String actPhone;
	private Date actStartDay;
	private Date actEndDay;
	private String actPlace;
	private int actPeople;
	private Date actRequestEnd;
	private int salNo;
	private int salCategory;
	private String salTitle;
	private int salPrice;
	private String salUrl;
	private String salContent;
	private String salGuide;
	private int salCount;
	private Date salDate;
	private String salStatus;
	
	public Activity() {}
	
	public Activity(int memId, String actPhone, Date actStartDay, Date actEndDay, String actPlace, int actPeople,
			Date actRequestEnd, int salNo, int salCategory, String salTitle, int salPrice, String salUrl,
			String salContent, String salGuide, int salCount, Date salDate, String salStatus) {
		super();
		this.memId = memId;
		this.actPhone = actPhone;
		this.actStartDay = actStartDay;
		this.actEndDay = actEndDay;
		this.actPlace = actPlace;
		this.actPeople = actPeople;
		this.actRequestEnd = actRequestEnd;
		this.salNo = salNo;
		this.salCategory = salCategory;
		this.salTitle = salTitle;
		this.salPrice = salPrice;
		this.salUrl = salUrl;
		this.salContent = salContent;
		this.salGuide = salGuide;
		this.salCount = salCount;
		this.salDate = salDate;
		this.salStatus = salStatus;
	}
	
	public int getMemId() {
		return memId;
	}


	public void setMemId(int memId) {
		this.memId = memId;
	}


	public String getActPhone() {
		return actPhone;
	}


	public void setActPhone(String actPhone) {
		this.actPhone = actPhone;
	}


	public Date getActStartDay() {
		return actStartDay;
	}


	public void setActStartDay(Date actStartDay) {
		this.actStartDay = actStartDay;
	}


	public Date getActEndDay() {
		return actEndDay;
	}


	public void setActEndDay(Date actEndDay) {
		this.actEndDay = actEndDay;
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


	public Date getActRequestEnd() {
		return actRequestEnd;
	}


	public void setActRequestEnd(Date actRequestEnd) {
		this.actRequestEnd = actRequestEnd;
	}


	public int getSalNo() {
		return salNo;
	}


	public void setSalNo(int salNo) {
		this.salNo = salNo;
	}


	public int getSalCategory() {
		return salCategory;
	}


	public void setSalCategory(int salCategory) {
		this.salCategory = salCategory;
	}


	public String getSalTitle() {
		return salTitle;
	}


	public void setSalTitle(String salTitle) {
		this.salTitle = salTitle;
	}


	public int getSalPrice() {
		return salPrice;
	}


	public void setSalPrice(int salPrice) {
		this.salPrice = salPrice;
	}


	public String getSalUrl() {
		return salUrl;
	}


	public void setSalUrl(String salUrl) {
		this.salUrl = salUrl;
	}


	public String getSalContent() {
		return salContent;
	}


	public void setSalContent(String salContent) {
		this.salContent = salContent;
	}


	public String getSalGuide() {
		return salGuide;
	}


	public void setSalGuide(String salGuide) {
		this.salGuide = salGuide;
	}


	public int getSalCount() {
		return salCount;
	}


	public void setSalCount(int salCount) {
		this.salCount = salCount;
	}


	public Date getSalDate() {
		return salDate;
	}


	public void setSalDate(Date salDate) {
		this.salDate = salDate;
	}


	public String getSalStatus() {
		return salStatus;
	}


	public void setSalStatus(String salStatus) {
		this.salStatus = salStatus;
	}

	@Override
	public String toString() {
		return "Activity [memId=" + memId + ", actPhone=" + actPhone + ", actStartDay=" + actStartDay + ", actEndDay="
				+ actEndDay + ", actPlace=" + actPlace + ", actPeople=" + actPeople + ", actRequestEnd=" + actRequestEnd
				+ ", salNo=" + salNo + ", salCategory=" + salCategory + ", salTitle=" + salTitle + ", salPrice="
				+ salPrice + ", salUrl=" + salUrl + ", salContent=" + salContent + ", salGuide=" + salGuide
				+ ", salCount=" + salCount + ", salDate=" + salDate + ", salStatus=" + salStatus + "]";
	}
}