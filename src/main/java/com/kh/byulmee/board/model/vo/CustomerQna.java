package com.kh.byulmee.board.model.vo;

import java.sql.Date;

public class CustomerQna {
	private int cusqnaNo;
	private String memId;
	private String cusqnaTitle;
	private String cusqnaCategory;
	private String cusqnaContent;
	private int cusqnaCount;
	private Date cusqnaDate;
	private String cusqnaStatus;
	
	public CustomerQna() {}

	public CustomerQna(int cusqnaNo, String memId, String cusqnaTitle, String cusqnaCategory, String cusqnaContent,
			int cusqnaCount, Date cusqnaDate, String cusqnaStatus) {
		super();
		this.cusqnaNo = cusqnaNo;
		this.memId = memId;
		this.cusqnaTitle = cusqnaTitle;
		this.cusqnaCategory = cusqnaCategory;
		this.cusqnaContent = cusqnaContent;
		this.cusqnaCount = cusqnaCount;
		this.cusqnaDate = cusqnaDate;
		this.cusqnaStatus = cusqnaStatus;
	}

	public int getCusqnaNo() {
		return cusqnaNo;
	}

	public void setCusqnaNo(int cusqnaNo) {
		this.cusqnaNo = cusqnaNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getCusqnaTitle() {
		return cusqnaTitle;
	}

	public void setCusqnaTitle(String cusqnaTitle) {
		this.cusqnaTitle = cusqnaTitle;
	}

	public String getCusqnaCategory() {
		return cusqnaCategory;
	}

	public void setCusqnaCategory(String cusqnaCategory) {
		this.cusqnaCategory = cusqnaCategory;
	}

	public String getCusqnaContent() {
		return cusqnaContent;
	}

	public void setCusqnaContent(String cusqnaContent) {
		this.cusqnaContent = cusqnaContent;
	}

	public int getCusqnaCount() {
		return cusqnaCount;
	}

	public void setCusqnaCount(int cusqnaCount) {
		this.cusqnaCount = cusqnaCount;
	}

	public Date getCusqnaDate() {
		return cusqnaDate;
	}

	public void setCusqnaDate(Date cusqnaDate) {
		this.cusqnaDate = cusqnaDate;
	}

	public String getCusqnaStatus() {
		return cusqnaStatus;
	}

	public void setCusqnaStatus(String cusqnaStatus) {
		this.cusqnaStatus = cusqnaStatus;
	}

	@Override
	public String toString() {
		return "CustomerQna [cusqnaNo=" + cusqnaNo + ", memId=" + memId + ", cusqnaTitle=" + cusqnaTitle
				+ ", cusqnaCategory=" + cusqnaCategory + ", cusqnaContent=" + cusqnaContent + ", cusqnaCount="
				+ cusqnaCount + ", cusqnaDate=" + cusqnaDate + ", cusqnaStatus=" + cusqnaStatus + "]";
	}
}