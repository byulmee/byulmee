package com.kh.byulmee.banner.model.vo;

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
public class Banner {
	private int banNo;
	private String banAlt;
	private String banOpen;
	private String banOrigin;
	private String banName;
	private String banPath;
	private String banUrl;
	private String banBgc;
}