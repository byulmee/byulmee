package com.kh.byulmee.board.model.vo;

import java.sql.Date;

public class Notice {
	private int notNo;
	private String memId;
	private String notTitle;
	private String notContent;
	private int notCount;
	private Date notDate;
	private String notStatus;
	
	public Notice() {}
	
	public Notice(int notNo, String memId, String notTitle, String notContent, int notCount, Date notDate,
			String notStatus) {
		super();
		this.notNo = notNo;
		this.memId = memId;
		this.notTitle = notTitle;
		this.notContent = notContent;
		this.notCount = notCount;
		this.notDate = notDate;
		this.notStatus = notStatus;
	}
	public int getNotNo() {
		return notNo;
	}
	public void setNotNo(int notNo) {
		this.notNo = notNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getNotTitle() {
		return notTitle;
	}
	public void setNotTitle(String notTitle) {
		this.notTitle = notTitle;
	}
	public String getNotContent() {
		return notContent;
	}
	public void setNotContent(String notContent) {
		this.notContent = notContent;
	}
	public int getNotCount() {
		return notCount;
	}
	public void setNotCount(int notCount) {
		this.notCount = notCount;
	}
	public Date getNotDate() {
		return notDate;
	}
	public void setNotDate(Date notDate) {
		this.notDate = notDate;
	}
	public String getNotStatus() {
		return notStatus;
	}
	public void setNotStatus(String notStatus) {
		this.notStatus = notStatus;
	}
	@Override
	public String toString() {
		return "Notice [notNo=" + notNo + ", memId=" + memId + ", notTitle=" + notTitle + ", notContent=" + notContent
				+ ", notCount=" + notCount + ", notDate=" + notDate + ", notStatus=" + notStatus + "]";
	}
}