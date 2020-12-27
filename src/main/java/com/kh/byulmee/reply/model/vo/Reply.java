package com.kh.byulmee.reply.model.vo;

import java.sql.Date;

public class Reply {
	private int repNo;
	private String memId;
	private String repContent;
	private Date repDate;
	private String repStatus;
	private int cusqnaNo;
	private int salqnaNo;
	
	public Reply() {}

	public Reply(int repNo, String memId, String repContent, Date repDate, String repStatus, int cusqnaNo,
			int salqnaNo) {
		super();
		this.repNo = repNo;
		this.memId = memId;
		this.repContent = repContent;
		this.repDate = repDate;
		this.repStatus = repStatus;
		this.cusqnaNo = cusqnaNo;
		this.salqnaNo = salqnaNo;
	}

	public int getRepNo() {
		return repNo;
	}

	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getRepContent() {
		return repContent;
	}

	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}

	public Date getRepDate() {
		return repDate;
	}

	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}

	public String getRepStatus() {
		return repStatus;
	}

	public void setRepStatus(String repStatus) {
		this.repStatus = repStatus;
	}

	public int getCusqnaNo() {
		return cusqnaNo;
	}

	public void setCusqnaNo(int cusqnaNo) {
		this.cusqnaNo = cusqnaNo;
	}

	public int getSalqnaNo() {
		return salqnaNo;
	}

	public void setSalqnaNo(int salqnaNo) {
		this.salqnaNo = salqnaNo;
	}

	@Override
	public String toString() {
		return "Reply [repNo=" + repNo + ", memId=" + memId + ", repContent=" + repContent + ", repDate=" + repDate
				+ ", repStatus=" + repStatus + ", cusqnaNo=" + cusqnaNo + ", salqnaNo=" + salqnaNo + "]";
	}
}