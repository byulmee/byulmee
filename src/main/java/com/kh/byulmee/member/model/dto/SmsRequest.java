package com.kh.byulmee.member.model.dto;

import lombok.Data;

@Data
public class SmsRequest {
	private String contentType;
	private String countryCode;
	private String from;
	private String subject;
	private String content;
	
	@Data
	public class Messages {
		private String to;
		private String subject;
		private String content;
	}
	
	@Data
	public class Files {
		private String name;
		private String body;
	}
}
