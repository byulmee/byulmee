package com.kh.byulmee.member.model.vo;

import java.sql.Date;

import com.kh.byulmee.image.model.vo.Image;
import com.kh.byulmee.activity.model.vo.Activity;
import com.kh.byulmee.product.model.vo.Product;

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
	private String memId;
	private Date favDate;
	private String favStatus;
	private int favRefcode;
	private int favRefno;
	
	private Image image;
	private Member member;
	private Activity activity;
	private Product product;
}
