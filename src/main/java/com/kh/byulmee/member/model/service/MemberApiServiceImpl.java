package com.kh.byulmee.member.model.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
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
import com.kh.byulmee.member.model.vo.Member;

/* by�떎�삙: 媛꾪렪 濡쒓렇�씤 諛� �씤利� 泥섎━ Sevice */
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
	
	/******** by�떎�삙: MSM 諛쒖넚 硫붿냼�뱶 ********/
	@Override
	public String getRandomCode() {
		//6�옄由ъ쓽 �궃�닔 �깮�꽦�븯�뒗 硫붿냼�뱶
		//random: �쁽�옱 �떆媛꾩쓽 諛�由ъ꽭而⑤뱶瑜� 湲곕컲�쑝濡� �궃�닔瑜� 諛쒖깮�떆�궡
		Random random = new Random(System.currentTimeMillis());
		//�궃�쓽 �옄由ъ닔 �꽕�젙
		int length = 6;
		
		int range = (int)Math.pow(10, length);
		int trim = (int)Math.pow(10, length-1);
		//0遺��꽣 range-1源뚯��쓽 �궃�닔瑜� 援ы븳 �썑 trim�쓣 �뜑�빐 6�옄由� �닽�옄媛� �맆 �닔 �엳寃� �븿
		int result = random.nextInt(range) + trim;
		
		//6�옄由щ�� 珥덇낵�븯硫� trim�쓣 類댁��떎.
		if(result > range) {
			result = result - trim;
		}
		return String.valueOf(result);
	}

	//�슂泥��뿉 �븘�슂�븳 key瑜� Base64濡� �븫�샇�솕�븯�뒗 硫붿냼�뱶
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
			//encodeBase64String = Base64.encodeBase64String(rawHmac);
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (NoSuchAlgorithmException | InvalidKeyException | IllegalStateException | UnsupportedEncodingException e) {
			throw new RuntimeException("signature �븫�샇�솕 以� �삤瑜� 諛쒖깮 ", e);
		}
	  return encodeBase64String;
	}

	@Override
	public String sendMmsRequest(String memPhone) {
		//�뿤�뜑 �옉�꽦
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
		
		//Body �옉�꽦
		//body�뿉 �떞�쓣 �슂泥� �젙蹂대뒗 json ���엯�쑝濡� �옉�꽦�빐以섏빞�븳�떎.
		String randomCode = getRandomCode();
		String message ="[Byulmee]�씤利앹쓣 �쐞�븳 肄붾뱶�뒗 [" + randomCode + "]�엯�땲�떎.";
		
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
		
		//臾몄옄 硫붿꽭吏� �슂泥� �쟾�넚
		final HttpEntity<String> smsRequest = new HttpEntity<>(body, headers);
		
		ResponseEntity<String> response = rt.exchange(
				requestUrl,
				HttpMethod.POST,
				smsRequest,
				String.class
		);
		
		
		//response �쓳�떟 寃곌낵 
		Gson gson = new Gson();
		SmsResponse smsResp = gson.fromJson(response.getBody(), SmsResponse.class);
		
		JSONObject result = new JSONObject();
		if(response != null) {
			result.put("code", randomCode);
			result.put("status", 200);
			
		} else {
			result.put("code", "�씤利앸쾲�샇瑜� 諛쒖넚�븯吏� 紐삵뻽�뒿�땲�떎.\n�옞�떆�썑 �떎�떆 �떆�룄�빐二쇱꽭�슂.");
			result.put("status", 405);
		}
		
		result.put("to", memPhone);
		
		String resultToJson = gson.toJson(result);
		
		return resultToJson;
	}
	
	
	
	/******** by�떎�삙: Email 諛쒖넚 硫붿냼�뱶 ********/
	@Override
	public String getEmailCode(Member member) {
		
		String memEmail = member.getMemEmail();
		String code = getRandomCode();
		
		//�씠硫붿씪 �꽌踰꾩뿉 �젒洹쇳븯湲� �쐞�븳 �젙蹂� �엯�젰
		Properties props = System.getProperties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		
		//�씤利� �젙蹂대�� �떞�� �꽭�뀡 �깮�꽦
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(smtpAccount, smtpPassword);
			}
		});

		
		MimeMessage message = new MimeMessage(session);
		
		try {
			//諛쒖넚 �떆媛�
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress("noReply@byulmee.com", "蹂꾨궃痍⑤��_蹂꾨��"));
			InternetAddress to = new InternetAddress(memEmail);
			message.addRecipient(Message.RecipientType.TO, to);
			message.setSubject("[蹂꾨��]鍮꾨�踰덊샇 �옱�꽕�젙�쓣 �쐞�븳 �씤利앸쾲�샇瑜� �엯�젰�빐二쇱꽭�슂.");
			String emailBody = "<div style=\"width: 100%; margin-bottom: 25px; padding: 30px 0; text-align: center;\"><br>" +
							   "	<span style=\"font-size: 16px; color: #FF6833; font-weight: 900; padding: 5px 0; margin: auto;\">蹂꾨궃痍⑤��_蹂꾨��</span>" +
							   "    <image src=\"https://user-images.githubusercontent.com/59134456/105507509-a12df100-5d0e-11eb-991a-d187e4bafea9.png\" height=\"32px;\" style=\"margin: auto;\"/>" + 
							   "    <hr style=\"width: 50%; height: 1px; margin-top: 20px; border:0; background-color: #FF6833;\">" + 
							   "</div>" + 
							   "<h1 style=\"width: 30%; margin: auto; border-radius: 20px; text-align: center; padding: 30px; background-color: #FDF5E6; font-size: 18px;\">�씤利� 踰덊샇<br><span style=\"color: #FF6833; font-size: 32px;\">" + code + "<span></h1>" + 
							   "<p style=\"text-align: center; font-size: 16px; line-height: 1.5rem; padding: 15px 0;\">鍮꾨�踰덊샇瑜� �옱�꽕�젙�븯湲� �쐞�븳 �씤利� 踰덊샇�엯�땲�떎.<br>鍮꾨�踰덊샇 蹂�寃쎌쓣 �쐞�빐 諛쒖넚�맂 �씤利앸쾲�샇瑜� �젙�솗�엳 �엯�젰�빐二쇱꽭�슂.</p>";
			message.setContent(emailBody, "text/html; charset=utf-8");
			
			Transport.send(message);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
			code = "�씠硫붿씪 �쟾�넚 �떎�뙣";
		}
		
		return code;
	}

	
	
	/******** by�떎�삙: 移댁뭅�삤 �씤利�&�씤媛� 硫붿냼�뱶 ********/
	@Override
	public KakaoToken getKakaoToken(String code) {
		RestTemplate rt = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); //吏�湲� �쟾�넚�븷 HTTP �뜲�씠�꽣媛� key-value �뜲�씠�꽣�엫�쓣 �븣由�
		
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
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8"); //吏�湲� �쟾�넚�븷 HTTP �뜲�씠�꽣媛� key-value �뜲�씠�꽣�엫�쓣 �븣由�
		
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
	
	/******** by�떎�삙: facebook �씤利� 硫붿냼�뱶 ********/
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
