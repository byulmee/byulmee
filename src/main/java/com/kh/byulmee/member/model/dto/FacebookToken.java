package com.kh.byulmee.member.model.dto;

import com.kh.byulmee.member.model.dto.KakaoProfile.KakaoAccount;
import com.kh.byulmee.member.model.dto.KakaoProfile.Properties;

import lombok.Data;

@Data
public class FacebookToken {
	private String status;
	
	public class AuthResponse {
		private String accessToken;
		private String expiresIn;
        private String signedRequest;
        private String userID;
	}
}
