package com.kh.byulmee.order.model.vo;

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
public class OrderSearch {
	private String searchId;
	private Date startday;
	private Date endday;
	private int refcode;
	private String starcode;
}
