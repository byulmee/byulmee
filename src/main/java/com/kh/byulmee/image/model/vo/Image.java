package com.kh.byulmee.image.model.vo;

import java.util.Date;

public class Image {
	private int imgNo;
	private String imgOrigin;
	private String imgName;
	private String imgPath;
	private Date imgDate;
	private int imgLevel;
	private String imgStatus;
	private int refCode;
	private int refNo;
	
	public Image() {}
	
	public Image(int imgNo, String imgOrigin, String imgName, String imgPath, Date imgDate, int imgLevel,
			String imgStatus, int refCode, int refNo) {
		super();
		this.imgNo = imgNo;
		this.imgOrigin = imgOrigin;
		this.imgName = imgName;
		this.imgPath = imgPath;
		this.imgDate = imgDate;
		this.imgLevel = imgLevel;
		this.imgStatus = imgStatus;
		this.refCode = refCode;
		this.refNo = refNo;
	}


	public int getImgNo() {
		return imgNo;
	}



	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}



	public String getImgOrigin() {
		return imgOrigin;
	}



	public void setImgOrigin(String imgOrigin) {
		this.imgOrigin = imgOrigin;
	}



	public String getImgName() {
		return imgName;
	}



	public void setImgName(String imgName) {
		this.imgName = imgName;
	}



	public String getImgPath() {
		return imgPath;
	}



	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}



	public Date getImgDate() {
		return imgDate;
	}



	public void setImgDate(Date imgDate) {
		this.imgDate = imgDate;
	}



	public int getImgLevel() {
		return imgLevel;
	}



	public void setImgLevel(int imgLevel) {
		this.imgLevel = imgLevel;
	}



	public String getImgStatus() {
		return imgStatus;
	}



	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}



	public int getRefCode() {
		return refCode;
	}



	public void setRefCode(int refCode) {
		this.refCode = refCode;
	}



	public int getRefNo() {
		return refNo;
	}



	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	@Override
	public String toString() {
		return "Image [imgNo=" + imgNo + ", imgOrigin=" + imgOrigin + ", imgName=" + imgName + ", imgPath=" + imgPath
				+ ", imgDate=" + imgDate + ", imgLevel=" + imgLevel + ", imgStatus=" + imgStatus + ", refCode="
				+ refCode + ", refNo=" + refNo + "]";
	}
	
}