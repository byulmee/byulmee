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
public class SalesQna {
	private int salqnaNo;
	private String memId;
	private String salqnaTitle;
	private String salqnaType;
	private Date salqnaDate;
	private String salqnaContent;
	private String salqnaStatus;
	private int salqnaRefcode;
	private int salqnaRefno;
}