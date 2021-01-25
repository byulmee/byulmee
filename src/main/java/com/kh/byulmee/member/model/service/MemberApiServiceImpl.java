package com.kh.byulmee.member.model.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
import com.kh.byulmee.member.model.vo.Member;

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
	
	@Value("#{keys['g.smtp.account']}")
	private String smtpAccount;
	@Value("#{keys['g.smtp.password']}")
	private String smtpPassword;
	
	@Value("#{keys['fb.clientId']}")
	private String fbClientId;
	@Value("#{keys['fb.redirectUri']}")
	private String fbRedirectUri;
	@Value("#{keys['fb.clientToken']}")
	private String fbClientToken;
	@Value("#{keys['fb.version']}")
	private String fbVersion;
	
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
		
		
		//response 응답 결과 
		Gson gson = new Gson();
		SmsResponse smsResp = gson.fromJson(response.getBody(), SmsResponse.class);
		
		JSONObject result = new JSONObject();
		if(response != null) {
			result.put("code", randomCode);
			result.put("status", 200);
			
		} else {
			result.put("code", "인증번호를 발송하지 못했습니다.\n잠시후 다시 시도해주세요.");
			result.put("status", 405);
		}
		
		result.put("to", memPhone);
		
		String resultToJson = gson.toJson(result);
		
		return resultToJson;
	}
	
	
	
	/******** by다혜: Email 발송 메소드 ********/
	@Override
	public String getEmailCode(Member member) {
		
		String memEmail = member.getMemEmail();
		String code = getRandomCode();
		
		//이메일 서버에 접근하기 위한 정보 입력
		Properties props = System.getProperties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		
		//인증 정보를 담은 세션 생성
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(smtpAccount, smtpPassword);
			}
		});

		
		MimeMessage message = new MimeMessage(session);
		
		try {
			//발송 시간
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress("noReply@byulmee.com", "별난취미_별미"));
			InternetAddress to = new InternetAddress(memEmail);
			message.addRecipient(Message.RecipientType.TO, to);
			message.setSubject("[별미]비밀번호 재설정을 위한 인증번호를 입력해주세요.");
			String emailBody = "<div style=\"width: 100%; margin-bottom: 25px; padding: 30px 0; text-align: center;\"><br>" +
							   "	<span style=\"font-size: 16px; color: #FF6833; font-weight: 900; padding: 5px 0; margin: auto;\">별난취미_별미</span>" +
							   "    <image src=\"https://user-images.githubusercontent.com/59134456/105507509-a12df100-5d0e-11eb-991a-d187e4bafea9.png\" height=\"32px;\" style=\"margin: auto;\"/>" + 
							   "    <hr style=\"width: 50%; height: 1px; margin-top: 20px; border:0; background-color: #FF6833;\">" + 
							   "</div>" + 
							   "<h1 style=\"width: 30%; margin: auto; border-radius: 20px; text-align: center; padding: 30px; background-color: #FDF5E6; font-size: 18px;\">인증 번호<br><span style=\"color: #FF6833; font-size: 32px;\">" + code + "<span></h1>" + 
							   "<p style=\"text-align: center; font-size: 16px; line-height: 1.5rem; padding: 15px 0;\">비밀번호를 재설정하기 위한 인증 번호입니다.<br>비밀번호 변경을 위해 발송된 인증번호를 정확히 입력해주세요.</p>";
			message.setContent(emailBody, "text/html; charset=utf-8");
			
			Transport.send(message);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
			code = "이메일 전송 실패";
		}
		
		return code;
	}

	
	
	/******** by다혜: 카카오 인증&인가 메소드 ********/
	@Override
	public KakaoToken getKakaoToken(String code) {
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
	
	/******** by다혜: facebook 인증 메소드 ********/
//	@Override
//	public String getFacebookToken() {
//		
//		String url = "https://graph.facebook.com/v2.8/oauth/access_token?"+
//				 	"client_id=" + fbClientId +
//				 	"&redirect_uri=" + fbRedirectUri +
//				 	"&client_secret=" + fbClientToken +
//				 	"&code=" + fbVersion;
//		
//		String faceBookAccessToken = "";
//		try {
//			HttpClient client = HttpClientBuilder.create().build();
//			HttpGet getRequest = new HttpGet(url);
//			
//			String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
//			
//			JSONObject jsonObject = (JSONObject)(new JSONParser().parse(rawJsonString));
//			
//			faceBookAccessToken = (String) jsonObject.get("access_token");
//		
//		} catch (IOException | ParseException e) {
//			e.printStackTrace();
//		}
	
//		return faceBookAccessToken;
//	}
}
