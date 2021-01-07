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
public class CustomerQna {
	private int cusqnaNo;
	private String memId;
	private String cusqnaTitle;
	private int cusqnaCategory;
	private String cusqnaContent;
	private int cusqnaCount;
	private Date cusqnaDate;
	private String cusqnaStatus;
}