package com.kh.byulmee.board.model.vo;

import java.sql.Date;

public class SalesQna {
	private int salqnaNo;
	private String memId;
	private String salqnaTitle;
	private String salqnaType;
	private Date salqnaDate;
	private String salqnaContent;
	private String salqnaStatus;
	private int salNo;
	
	public SalesQna() {}

	public SalesQna(int salqnaNo, String memId, String salqnaTitle, String salqnaType, Date salqnaDate,
			String salqnaContent, String salqnaStatus, int salNo) {
		super();
		this.salqnaNo = salqnaNo;
		this.memId = memId;
		this.salqnaTitle = salqnaTitle;
		this.salqnaType = salqnaType;
		this.salqnaDate = salqnaDate;
		this.salqnaContent = salqnaContent;
		this.salqnaStatus = salqnaStatus;
		this.salNo = salNo;
	}

	public int getSalqnaNo() {
		return salqnaNo;
	}

	public void setSalqnaNo(int salqnaNo) {
		this.salqnaNo = salqnaNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getSalqnaTitle() {
		return salqnaTitle;
	}

	public void setSalqnaTitle(String salqnaTitle) {
		this.salqnaTitle = salqnaTitle;
	}

	public String getSalqnaType() {
		return salqnaType;
	}

	public void setSalqnaType(String salqnaType) {
		this.salqnaType = salqnaType;
	}

	public Date getSalqnaDate() {
		return salqnaDate;
	}

	public void setSalqnaDate(Date salqnaDate) {
		this.salqnaDate = salqnaDate;
	}

	public String getSalqnaContent() {
		return salqnaContent;
	}

	public void setSalqnaContent(String salqnaContent) {
		this.salqnaContent = salqnaContent;
	}

	public String getSalqnaStatus() {
		return salqnaStatus;
	}

	public void setSalqnaStatus(String salqnaStatus) {
		this.salqnaStatus = salqnaStatus;
	}

	public int getSalNo() {
		return salNo;
	}

	public void setSalNo(int salNo) {
		this.salNo = salNo;
	}

	@Override
	public String toString() {
		return "SalesQna [salqnaNo=" + salqnaNo + ", memId=" + memId + ", salqnaTitle=" + salqnaTitle + ", salqnaType="
				+ salqnaType + ", salqnaDate=" + salqnaDate + ", salqnaContent=" + salqnaContent + ", salqnaStatus="
				+ salqnaStatus + ", salNo=" + salNo + "]";
	}
}