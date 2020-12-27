package com.kh.byulmee.review.model.vo;

import java.sql.Date;

public class Review {
	private int revNo;
	private String memId;
	private String revType;
	private int revRating;
	private Date revDate;
	private String revContent;
	private int revStatus;
	private int salNo;
	
	public Review() {}

	public Review(int revNo, String memId, String revType, int revRating, Date revDate, String revContent,
			int revStatus, int salNo) {
		super();
		this.revNo = revNo;
		this.memId = memId;
		this.revType = revType;
		this.revRating = revRating;
		this.revDate = revDate;
		this.revContent = revContent;
		this.revStatus = revStatus;
		this.salNo = salNo;
	}
	
	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getRevType() {
		return revType;
	}

	public void setRevType(String revType) {
		this.revType = revType;
	}

	public int getRevRating() {
		return revRating;
	}

	public void setRevRating(int revRating) {
		this.revRating = revRating;
	}

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public int getRevStatus() {
		return revStatus;
	}

	public void setRevStatus(int revStatus) {
		this.revStatus = revStatus;
	}

	public int getSalNo() {
		return salNo;
	}

	public void setSalNo(int salNo) {
		this.salNo = salNo;
	}

	@Override
	public String toString() {
		return "Review [revNo=" + revNo + ", memId=" + memId + ", revType=" + revType + ", revRating=" + revRating
				+ ", revDate=" + revDate + ", revContent=" + revContent + ", revStatus=" + revStatus + ", salNo="
				+ salNo + "]";
	}
}