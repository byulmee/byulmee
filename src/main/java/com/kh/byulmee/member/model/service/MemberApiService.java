package com.kh.byulmee.member.model.service;

import org.springframework.web.client.RestTemplate;

import com.kh.byulmee.member.model.dto.KakaoProfile;
import com.kh.byulmee.member.model.dto.KakaoToken;

public interface MemberApiService {

	KakaoToken getKakaoToken(String code);

	KakaoProfile getKakaoUser(KakaoToken kakaoToken);

}
