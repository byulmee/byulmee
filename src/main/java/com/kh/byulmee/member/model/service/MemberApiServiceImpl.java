package com.kh.byulmee.member.model.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.kh.byulmee.member.model.dto.SmsResponse;

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
	
	@Value("#{keys['n.AccessKeyId']}")
	private String nAccessKey;
	@Value("#{keys['n.SecreatKey']}")
	private String nSecreateKey;
	@Value("#{keys['n.smsServiceId']}")
	private String smsServiceId;
	@Value("#{keys['n.from']}")
	private String from;
	
	
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

	
	/******** by다혜: MSM 발송 메소드 ********/
	@Override
	public String getRandomCode() {
		//6자리의 난수 생성하는 메소드
		//random: 현재 시간의 밀리세컨드를 기반으로 난수를 발생시킴
		Random random = new Random(System.currentTimeMillis());
		//난의 자리수 설정
		int length = 6;
		
		int range = (int)Math.pow(10, length);
		int trim = (int)Math.pow(10, length-1);
		//0부터 range-1까지의 난수를 구한 후 trim을 더해 6자리 숫자가 될 수 있게 함
		int result = random.nextInt(range) + trim;
		
		//6자리를 초과하면 trim을 뺴준다.
		if(result > range) {
			result = result - trim;
		}
		return String.valueOf(result);
	}

	//요청에 필요한 key를 Base64로 암호화하는 메소드
	public String makeSignature(String timestamp, String uri) {
		String space = " ";
		String newLine = "\n";
		String method = "POST";

		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(uri)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(nAccessKey)
			.toString();
		
		String encodeBase64String = "";
		try {
			SecretKeySpec signingKey = new SecretKeySpec(nSecreateKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.encodeBase64String(rawHmac);
		} catch (NoSuchAlgorithmException | InvalidKeyException | IllegalStateException | UnsupportedEncodingException e) {
			throw new RuntimeException("signature 암호화 중 오류 발생 ", e);
		}
	  return encodeBase64String;
	}

	@Override
	public String sendMmsRequest(String memPhone) {
		//헤더 작성
		String timestamp = Long.toString(System.currentTimeMillis());
		String hostUrl = "https://sens.apigw.ntruss.com";
		String uri = "/sms/v2/services/" + smsServiceId + "/messages";
		String requestUrl = hostUrl+uri;
		String signature = makeSignature(timestamp, uri);
		
		RestTemplate rt = new RestTemplate();
		
		final HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		headers.add("x-ncp-apigw-timestamp", timestamp);
		headers.add("x-ncp-iam-access-key", nAccessKey);
		headers.add("x-ncp-apigw-signature-v2", signature);
		
		//Body 작성
		//body에 담을 요청 정보는 json 타입으로 작성해줘야한다.
		String randomCode = getRandomCode();
		String message ="[Byulmee]인증을 위한 코드는 [" + randomCode + "]입니다.";
		
		JSONObject jBody = new JSONObject();
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		jObj.put("to", memPhone);
		jArray.add(jObj);
		
		jBody.put("type", "SMS");
		jBody.put("countryCode", "82");
		jBody.put("from", from);
		jBody.put("content", message);
		jBody.put("messages", jArray);
		
		String body = jBody.toString();
		
		//문자 메세지 요청 전송
		final HttpEntity<String> smsRequest = new HttpEntity<>(body, headers);
		
		ResponseEntity<String> response = rt.exchange(
				requestUrl,
				HttpMethod.POST,
				smsRequest,
				String.class
		);
		
		Gson gson = new Gson();
		SmsResponse smsResp = gson.fromJson(response.getBody(), SmsResponse.class);
		

		JSONObject result = new JSONObject();
		result.put("code", randomCode);
		result.put("to", memPhone);
		result.put("status", smsResp.getStatusCode());
		result.put("statusName", smsResp.getStatusName());
		
		String resultToJson = gson.toJson(result);
		
		return resultToJson;
	}
}
