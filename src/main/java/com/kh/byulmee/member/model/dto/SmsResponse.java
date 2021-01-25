package com.kh.byulmee.member.model.dto;

import lombok.Data;

@Data
public class SmsResponse {
	 private String requestId;
	 private String requestTime;
	 private String statusCode;
	 private String statusName;
}
