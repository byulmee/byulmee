package com.kh.byulmee.banner.model.vo;

import java.sql.Date;

public class Banner {
	private int banNo;
	private String banAlt;
	private String banOpen;
	
	public Banner() {}

	public Banner(int banNo, String banAlt, String banOpen) {
		super();
		this.banNo = banNo;
		this.banAlt = banAlt;
		this.banOpen = banOpen;
	}

	public int getBanNo() {
		return banNo;
	}

	public void setBanNo(int banNo) {
		this.banNo = banNo;
	}

	public String getBanAlt() {
		return banAlt;
	}

	public void setBanAlt(String banAlt) {
		this.banAlt = banAlt;
	}

	public String getBanOpen() {
		return banOpen;
	}

	public void setBanOpen(String banOpen) {
		this.banOpen = banOpen;
	}

	@Override
	public String toString() {
		return "Banner [banNo=" + banNo + ", banAlt=" + banAlt + ", banOpen=" + banOpen + "]";
	}
}
