package com.kh.byulmee.member.model.vo;

public class Address {
	private int addNo;
	private String memId;
	private String addPlace;
	private String addName;
	private int addPostcode;
	private String addBasicaddr;
	private String addDetailaddr;
	private String addPhone;
	private String addChoice;
	
	public Address() {}
			
	public Address(int addNo, String memId, String addPlace, String addName, int addPostcode, String addBasicaddr,
			String addDetailaddr, String addPhone, String addChoice) {
		super();
		this.addNo = addNo;
		this.memId = memId;
		this.addPlace = addPlace;
		this.addName = addName;
		this.addPostcode = addPostcode;
		this.addBasicaddr = addBasicaddr;
		this.addDetailaddr = addDetailaddr;
		this.addPhone = addPhone;
		this.addChoice = addChoice;
	}
	
	public int getAddNo() {
		return addNo;
	}

	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getAddPlace() {
		return addPlace;
	}

	public void setAddPlace(String addPlace) {
		this.addPlace = addPlace;
	}

	public String getAddName() {
		return addName;
	}

	public void setAddName(String addName) {
		this.addName = addName;
	}

	public int getAddPostcode() {
		return addPostcode;
	}

	public void setAddPostcode(int addPostcode) {
		this.addPostcode = addPostcode;
	}

	public String getAddBasicaddr() {
		return addBasicaddr;
	}

	public void setAddBasicaddr(String addBasicaddr) {
		this.addBasicaddr = addBasicaddr;
	}

	public String getAddDetailaddr() {
		return addDetailaddr;
	}

	public void setAddDetailaddr(String addDetailaddr) {
		this.addDetailaddr = addDetailaddr;
	}

	public String getAddPhone() {
		return addPhone;
	}

	public void setAddPhone(String addPhone) {
		this.addPhone = addPhone;
	}

	public String getAddChoice() {
		return addChoice;
	}

	public void setAddChoice(String addChoice) {
		this.addChoice = addChoice;
	}

	@Override
	public String toString() {
		return "Address [addNo=" + addNo + ", memId=" + memId + ", addPlace=" + addPlace + ", addName=" + addName
				+ ", addPostcode=" + addPostcode + ", addBasicaddr=" + addBasicaddr + ", addDetailaddr=" + addDetailaddr
				+ ", addPhone=" + addPhone + ", addChoice=" + addChoice + "]";
	}
}