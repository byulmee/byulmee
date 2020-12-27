package com.kh.byulmee.member.model.vo;

import java.sql.Date;

public class Member {
	private String memId;
	private String memPwd;
	private String memName;
	private int memPostcode;
	private String memBasicAddr;
	private String memDetailAddr;
	private String memPhone;
	private String memNickname;
	private String memEmail;
	private int memLevel;
	private Date memDate;
	private String memStatus;
	
	public Member() {}

	public Member(String memId, String memPwd, String memName, int memPostcode, String memBasicAddr,
			String memDetailAddr, String memPhone, String memNickname, String memEmail, int memLevel, Date memDate,
			String memStatus) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memPostcode = memPostcode;
		this.memBasicAddr = memBasicAddr;
		this.memDetailAddr = memDetailAddr;
		this.memPhone = memPhone;
		this.memNickname = memNickname;
		this.memEmail = memEmail;
		this.memLevel = memLevel;
		this.memDate = memDate;
		this.memStatus = memStatus;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public int getMemPostcode() {
		return memPostcode;
	}

	public void setMemPostcode(int memPostcode) {
		this.memPostcode = memPostcode;
	}

	public String getMemBasicAddr() {
		return memBasicAddr;
	}

	public void setMemBasicAddr(String memBasicAddr) {
		this.memBasicAddr = memBasicAddr;
	}

	public String getMemDetailAddr() {
		return memDetailAddr;
	}

	public void setMemDetailAddr(String memDetailAddr) {
		this.memDetailAddr = memDetailAddr;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public int getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}

	public Date getMemDate() {
		return memDate;
	}

	public void setMemDate(Date memDate) {
		this.memDate = memDate;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	@Override
	public String toString() {
		return "Member [memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName + ", memPostcode=" + memPostcode
				+ ", memBasicAddr=" + memBasicAddr + ", memDetailAddr=" + memDetailAddr + ", memPhone=" + memPhone
				+ ", memNickname=" + memNickname + ", memEmail=" + memEmail + ", memLevel=" + memLevel + ", memDate="
				+ memDate + ", memStatus=" + memStatus + "]";
	}
}