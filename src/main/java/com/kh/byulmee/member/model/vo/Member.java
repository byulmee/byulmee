package com.kh.byulmee.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude = "memPwd")
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String memPostcode;
	private String memBasicAddr;
	private String memDetailAddr;
	private String memPhone;
	private String memNickname;
	private String memEmail;
	private int memLevel;
	private Date memDate;
	private String memStatus;
	private String memLoginType;
}