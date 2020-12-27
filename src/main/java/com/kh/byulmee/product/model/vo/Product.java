package com.kh.byulmee.product.model.vo;

import java.sql.Date;

public class Product {
	private int proNo;
	private String memId;
	private int proCharge;
	private int proStock;
	private int proMaximum;
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
	
	public Product() {}
	
	public Product(int proNo, String memId, int proCharge, int proStock, int proMaximum, int salNo, int salCategory,
			String salTitle, int salPrice, String salUrl, String salContent, String salGuide, int salCount,
			Date salDate, String salStatus) {
		super();
		this.proNo = proNo;
		this.memId = memId;
		this.proCharge = proCharge;
		this.proStock = proStock;
		this.proMaximum = proMaximum;
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

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getProCharge() {
		return proCharge;
	}

	public void setProCharge(int proCharge) {
		this.proCharge = proCharge;
	}

	public int getProStock() {
		return proStock;
	}

	public void setProStock(int proStock) {
		this.proStock = proStock;
	}

	public int getProMaximum() {
		return proMaximum;
	}

	public void setProMaximum(int proMaximum) {
		this.proMaximum = proMaximum;
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
		return "Product [proNo=" + proNo + ", memId=" + memId + ", proCharge=" + proCharge + ", proStock=" + proStock
				+ ", proMaximum=" + proMaximum + ", salNo=" + salNo + ", salCategory=" + salCategory + ", salTitle="
				+ salTitle + ", salPrice=" + salPrice + ", salUrl=" + salUrl + ", salContent=" + salContent
				+ ", salGuide=" + salGuide + ", salCount=" + salCount + ", salDate=" + salDate + ", salStatus="
				+ salStatus + "]";
	}
}