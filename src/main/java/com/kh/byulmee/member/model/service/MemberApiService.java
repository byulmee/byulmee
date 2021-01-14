package com.kh.byulmee.member.model.service;

import java.util.HashMap;

import org.springframework.web.client.RestTemplate;

import com.kh.byulmee.member.model.dto.KakaoProfile;
import com.kh.byulmee.member.model.dto.KakaoToken;
import com.kh.byulmee.member.model.dto.SmsResponse;

public interface MemberApiService {

	KakaoToken getKakaoToken(String code);

	KakaoProfile getKakaoUser(KakaoToken kakaoToken);

	String getRandomCode();
	
	String makeSignature(String timestamp, String uri);

	String sendMmsRequest(String memPhone);

}
