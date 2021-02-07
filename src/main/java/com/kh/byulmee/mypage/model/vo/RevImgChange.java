package com.kh.byulmee.mypage.model.vo;

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
public class RevImgChange {
	private int revNo;
	private int beforeLevel;
	private int afterLevel;
}
