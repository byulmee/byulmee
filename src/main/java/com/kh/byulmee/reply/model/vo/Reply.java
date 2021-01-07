package com.kh.byulmee.reply.model.vo;

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
public class Reply {
	private int repNo;
	private String memId;
	private String repContent;
	private Date repDate;
	private String repStatus;
	private int repRefcode;
	private int repRefno;
}