package com.kh.byulmee.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.kh.byulmee.member.model.dao.MemberDAO;
import com.kh.byulmee.member.model.dto.KakaoProfile;
import com.kh.byulmee.member.model.dto.KakaoToken;

/* by다혜: 간편 로그인 및 인증 처리 Sevice */
@Service("mApiService")
public class MemberApiServiceImpl implements MemberApiService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Value("#{keys['k.clientId']}")
	private String kClientId;
	
	@Value("#{keys['k.redirectUri']}")
	private String kRedirectUri;

	
	/******** by다혜: 카카오 인증&인가 메소드 ********/
	@Override
	public KakaoToken getKakaoToken(String code) {
		System.out.println(kClientId + "" + kRedirectUri);
		RestTemplate rt = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); //지금 전송할 HTTP 데이터가 key-value 데이터임을 알림
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", kClientId);
		params.add("redirect_uri", kRedirectUri);
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
		);
	
		Gson gson = new Gson();
		KakaoToken kakaoToken = gson.fromJson(response.getBody(), KakaoToken.class);
		
		return kakaoToken;
	}

	@Override
	public KakaoProfile getKakaoUser(KakaoToken kakaoToken) {
		RestTemplate rt = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + kakaoToken.getAccess_token());
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8"); //지금 전송할 HTTP 데이터가 key-value 데이터임을 알림
		
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers);
		
		ResponseEntity<String> response = rt.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest,
				String.class
		);
		
		Gson gson = new Gson();
		KakaoProfile kakaoProfile = gson.fromJson(response.getBody(), KakaoProfile.class);
		
		return kakaoProfile;
	}
}
