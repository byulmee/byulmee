package com.kh.byulmee.image.model.vo;

import java.util.Date;

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
public class Image {
	private int imgNo;
	private String imgOrigin;
	private String imgName;
	private String imgPath;
	private Date imgDate;
	private int imgLevel;
	private String imgStatus;
	private int imgRefcode;
	private int imgRefno;
}