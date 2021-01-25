package com.kh.byulmee.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Address {
	private int addNo;
	private String memId;
	private String addPlace;
	private String addName;
	private String addPostcode;
	private String addBasicaddr;
	private String addDetailaddr;
	private String addPhone;
	private String addChoice;
}