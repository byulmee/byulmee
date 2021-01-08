package com.kh.byulmee.product.model.vo;

import java.sql.Date;

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
	
	public Product() {}
	
	public Product(int proNo, String memId, int proCharge, int proStock, int proMaximum, int proCategory,
			String proTitle, int proPrice, String proUrl, String proContent, String proGuide, int proCount,
			Date proDate, String proStatus) {
		super();
		this.proNo = proNo;
		this.memId = memId;
		this.proCharge = proCharge;
		this.proStock = proStock;
		this.proMaximum = proMaximum;
		this.proCategory = proCategory;
		this.proTitle = proTitle;
		this.proPrice = proPrice;
		this.proUrl = proUrl;
		this.proContent = proContent;
		this.proGuide = proGuide;
		this.proCount = proCount;
		this.proDate = proDate;
		this.proStatus = proStatus;
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

	public int getProCategory() {
		return proCategory;
	}

	public void setProCategory(int proCategory) {
		this.proCategory = proCategory;
	}

	public String getProTitle() {
		return proTitle;
	}

	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public String getProUrl() {
		return proUrl;
	}

	public void setProUrl(String proUrl) {
		this.proUrl = proUrl;
	}

	public String getProContent() {
		return proContent;
	}

	public void setProContent(String proContent) {
		this.proContent = proContent;
	}

	public String getProGuide() {
		return proGuide;
	}

	public void setProGuide(String proGuide) {
		this.proGuide = proGuide;
	}

	public int getProCount() {
		return proCount;
	}

	public void setProCount(int proCount) {
		this.proCount = proCount;
	}

	public Date getProDate() {
		return proDate;
	}

	public void setProDate(Date proDate) {
		this.proDate = proDate;
	}

	public String getProStatus() {
		return proStatus;
	}

	public void setProStatus(String proStatus) {
		this.proStatus = proStatus;
	}

	@Override
	public String toString() {
		return "Product [proNo=" + proNo + ", memId=" + memId + ", proCharge=" + proCharge + ", proStock=" + proStock
				+ ", proMaximum=" + proMaximum + ", proCategory=" + proCategory + ", proTitle=" + proTitle
				+ ", proPrice=" + proPrice + ", proUrl=" + proUrl + ", proContent=" + proContent + ", proGuide="
				+ proGuide + ", proCount=" + proCount + ", proDate=" + proDate + ", proStatus=" + proStatus + "]";
	}
	
	
}