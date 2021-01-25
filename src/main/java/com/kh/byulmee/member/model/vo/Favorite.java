package com.kh.byulmee.member.model.vo;

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
public class Favorite {
	private int favNo;
	private Date favDate;
	private String favStatus;
	private int favRefcode;
	private int favRefno;
}
