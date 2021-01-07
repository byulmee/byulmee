package com.kh.byulmee.review.model.vo;

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
public class Review {
	private int revNo;
	private String memId;
	private int revRating;
	private Date revDate;
	private String revContent;
	private String revStatus;
	private int revRefcode;
	private int revRefno;
}