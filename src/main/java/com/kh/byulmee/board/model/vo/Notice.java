package com.kh.byulmee.board.model.vo;

import java.sql.Date;

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
public class Notice {
	private int notNo;
	private String memId;
	private String notTitle;
	private String notContent;
	private int notCount;
	private Date notDate;
	private String notStatus;
}