package com.hanul.anafor;

import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import common.CommonService;
import user.UserVO;
import web_user.WuserService;
import web_user.WuserServiceImpl;

@Controller
public class Web_UserController {


		//네이버 클라이언트 아이디
		private String naver_client_id = "szRRJL0N7PYQvmPTLsqe";
		//카카오 Rest Api key
		private String kakao_client_id = "332e22f7f60243ff3e09b710e7cfd590";
		
		@Autowired CommonService common;
		@Autowired WuserServiceImpl service;
		
		@Autowired @Qualifier("ateam") SqlSession sql;
		
		//로그인 페이지

		@RequestMapping("/userLogin")
		public String userLogin(HttpSession session) {
			session.setAttribute("category", "login");
			return "user/login";
		}
		
	
		//이메일 발송
		@ResponseBody
		@RequestMapping("/sendEmailChk")
		public int sendEmailchk(String email) {
			return common.sendCheckEmail(email);
		}
		
		
		//이메일 중복 처리
		 @ResponseBody
		 @RequestMapping("/userEmailChk")
		 public boolean userEmailChk(String id) {
			 return service.user_email_chk(id);	
		 }
		
		 //임시 비밀번호 발급 페이지
		 @RequestMapping("/findpw")
		 public String findPw() {
			 return "user/findpw";
		 }
		 
		 
		 //비밀번호 찾기 (임시 이메일 발송)
		 @ResponseBody
		 @RequestMapping("/sendTempPW")
		 public boolean sendTempPW(String id) {
			 if(! service.user_email_chk(id)) { 	//해당 메일이 DB에 존재할때
				 common.sendFindPw(id);
				 return true;
			 }else {
				 return false;						//해당 메일이 존재하지 않을때
			 }
		 }
		
		//로그인 처리 (ajax 사용시 ResponseBody )
		@ResponseBody
		@RequestMapping("/userLoginChk")
		public boolean userLoginChk(HttpSession session, UserVO vo) {
		
			UserVO vo1 = service.user_login(vo);
			session.setAttribute("loginInfo", vo1);
			
			return vo1 == null ? false: true;   //로그인 실패 했을시 false, 맞으면 true
		}
		
		//로그아웃 처리
		@RequestMapping("/logout")
		public String userLogout(HttpSession session) {
			
			session.setAttribute("loginInfo", null);
			
			return "redirect:/";
			
		}
		
		//회원가입 페이지
		@RequestMapping("/userJoin")
		public String userJoin(HttpSession session) {
			session.setAttribute("category", "join");
			return "user/join";
		}
		
		//회원가입 정보 DB 저장
		@RequestMapping("/userjoinChk")
		public String userJoinChk(UserVO vo) {
			service.user_join(vo);
			return "user/login";
		}
		
		
		//카카오 로그인
		@RequestMapping("/kakaoLogin")
		public String kakaoLogin(HttpSession session) {
			
			String state = UUID.randomUUID().toString();
			session.setAttribute("state", state);
			
			//https://kauth.kakao.com/oauth/authorize?response_type=code
			//&client_id=${REST_API_KEY}
			//&redirect_uri=${REDIRECT_URI}
			
			StringBuffer url = new StringBuffer("https://kauth.kakao.com/oauth/authorize?response_type=code");
			url.append("&client_id=").append(kakao_client_id);
			url.append("&state=").append(state);
			url.append("&redirect_uri=http://192.168.0.16/anafor/kakao_callback");		
			
			return "redirect:"+url.toString();
		}
		
		//카카오 로그인 콜백 요청
		@RequestMapping("/kakao_callback")
		public String kakaoCallback(HttpSession session, String code, String state, String error) {
			if(!state.equals(session.getAttribute("state"))|| error != null ) {
				return "redirect:/";
			}
			
			//--접근 토큰 발급 요청 : 토큰받기 (sample - request)
			
//			curl -v -X POST "https://kauth.kakao.com/oauth/token" \
//			 -H "Content-Type: application/x-www-form-urlencoded" \
//			 -d "grant_type=authorization_code" \
//			 -d "client_id=${REST_API_KEY}" \
//			 --data-urlencode "redirect_uri=${REDIRECT_URI}" \
//			 -d "code=${AUTHORIZE_CODE}"
			
			StringBuffer url = new StringBuffer("https://kauth.kakao.com/oauth/token?grant_type=authorization_code");
			url.append("&client_id=").append(kakao_client_id);
			url.append("&redirect_uri=http://192.168.0.16/anafor/kakao_callback");
			url.append("&code=").append(code);
			
			JSONObject json = new JSONObject(common.requestAPI(url));
			String token = json.getString("access_token");
			String type =json.getString("token_type");
			
			
			//-- 액세스 토큰 사용하여 모든 정보 받기(sample - 사용자 정보 가져오기)
			
//			curl -v -X GET "https://kapi.kakao.com/v2/user/me" \
//			  -H "Authorization: Bearer ${ACCESS_TOKEN}"
			
			url = new StringBuffer("https://kapi.kakao.com/v2/user/me");
			json = new JSONObject(common.requestAPI(url, type+" "+token));
			if(! json.isEmpty()) {  //json 안에 값이 있다면 저장하기
				//[필수] 필수 제공 항목 닉네임 | 	[선택] 선택 제공 항목	카카오계정(이메일)	성별  생일
				UserVO vo = new UserVO();
				vo.setSocial_id(json.get("id").toString());			//소셜제공 아이디
				json = json.getJSONObject("kakao_account");
				System.out.println(json);
				vo.setUser_id(json.getString("email"));
				vo.setUser_pw(json.getString("email"));
				vo.setSocial_type("user_kakao");
				vo.setUser_name(json.getJSONObject("profile").getString("nickname"));
				vo.setUser_gender(json.has("gender") && json.getString("gender").equals("female")? "여": "남");
				//카카오 최초 로그인인 경우 회원정보 저장 insert // 카카오 로그인 이력이 있어 회원정보가 있다면 변경 저장
				 if(service.user_social_email(vo)) { 
					 service.user_social_update(vo); 
				}else{ service.user_social_insert(vo); } //vo에 담은 데이터를 session의 loginInfo에 담음
				 vo.setAdmin("N");
				 session.setAttribute("loginInfo", vo);
			}
			return "redirect:/";
//			HTTP/1.1 200 OK
//			{
//			    "id":123456789,
//			    "kakao_account": { 
//			        "profile_needs_agreement": false,
//			        "profile": {
//			            "nickname": "홍길동",
//			            "thumbnail_image_url": "http://yyy.kakao.com/.../img_110x110.jpg",
//			            "profile_image_url": "http://yyy.kakao.com/dn/.../img_640x640.jpg",
//			            "is_default_image":false
//			        },
//			        "name_needs_agreement":false, 
//			        "name":"홍길동",
//			        "email_needs_agreement":false, 
//			        "is_email_valid": true,   
//			        "is_email_verified": true,
//			        "email": "sample@sample.com",
//			        "age_range_needs_agreement":false,
//			        "age_range":"20~29",
//			        "birthday_needs_agreement":false,
//			        "birthday":"1130",
//			        "gender_needs_agreement":false,
//			        "gender":"female"
//			    },  
//			    "properties":{
//			        "nickname":"홍길동카톡",
//			        "thumbnail_image":"http://xxx.kakao.co.kr/.../aaa.jpg",
//			        "profile_image":"http://xxx.kakao.co.kr/.../bbb.jpg",
//			        "custom_field1":"23",
//			        "custom_field2":"여"
//			        ...
//			    }
//			}
		}
		
		
	
		//네이버 로그인 요청
		@RequestMapping("/naverLogin")
		public String naverLogin(HttpSession session) {
			//3.4.2 네이버 로그인 연동 URL 생성하기
			String state = UUID.randomUUID().toString();
			
			//state 정보를 session 범위 내에서 계속 사용해야 하므로 session에 담음
			session.setAttribute("state", state);
			
			//https://nid.naver.com/oauth2.0/authorize?response_type=code
			//&client_id=CLIENT_ID&state=STATE_STRING
			//&redirect_uri=CALLBACK_URL
			
			StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/authorize?response_type=code");
			url.append("&client_id=").append(naver_client_id);
			url.append("&state=").append(state);
			url.append("&redirect_uri=http://localhost/anafor/naver_callback");
			System.out.println(url.toString());
			
			return "redirect:"+ url.toString();
		}
		
		//네이버 로그인 콜백 요청
		@RequestMapping("/naver_callback")
		public String navercallback(@RequestParam(required=false) String code, String state,@RequestParam(required=false) String error,
				 HttpSession session) {
			//state 값이 맞지 않거나 에러가 발생해도 토큰 발급 불가
			if(!state.equals(session.getAttribute("state")) || error != null){
				return "redirect:/"; //메인 페이지로 이동
			}
			
			//개발 가이드 3.4.4. 접근 토큰 발급 요청 참조
			//https://nid.naver.com/oauth2.0/token?grant_type=authorization_code
			//&client_id=jyvqXeaVOVmV
			//&client_secret=527300A0_COq1_XV33cf
			//&code=EIc5bFrl4RibFls1
			//&state=9kgsGTfH4j7IyAkg  
			StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code");
			url.append("&client_id=").append(naver_client_id);
			url.append("&client_secret=sP8w3ahjpG");
			url.append("&code=").append(code);
			url.append("&state=").append(state);
			
			//3.4.5 접근 토큰을 이용하여 프로필 API 호출
			
			JSONObject json = new JSONObject(common.requestAPI(url));
			String token = json.getString("access_token");
			String type =json.getString("token_type");
			//curl  -XGET "https://openapi.naver.com/v1/nid/me" \
		    //  -H "Authorization: Bearer AAAAPIuf0L+qfDkMABQ3IJ8heq2mlw71DojBj3oc2Z6OxMQESVSrtR0dbvsiQbPbP1/cxva23n7mQShtfK4pchdk/rc="
			
			// 출생 연도 휴대전화번호 이름 이메일 주소 성별 생일(네이버는 필수정보)
			url = new StringBuffer("https://openapi.naver.com/v1/nid/me");
			json = new JSONObject(common.requestAPI(url,type + " " +token));
			if(json.getString("resultcode").equals("00")) {
				
				json = json.getJSONObject("response");
				
				//회원정보 DB에 담기 위해 객체 생성
				UserVO vo = new UserVO();
				vo.setSocial_type("user_naver");
				vo.setUser_id(json.getString("email"));
				vo.setUser_pw(json.getString("email"));
				vo.setUser_name(json.getString("name"));
				vo.setSocial_id(json.getString("id"));
				String phone = json.getString("mobile"); //전화번호 하이픈 제거
				phone=phone.replace("-", "");
				vo.setUser_tel(phone);
				
				String birthday= json.getString("birthday");
				birthday = birthday.replace("-", "");		//생년월일 날짜 하이픈 제거
				
				vo.setUser_birth(json.getString("birthyear")+birthday);
				vo.setUser_gender(json.has("gender") && json.getString("gender").equals("F") ? "여" : "남");
				
				if(service.user_social_email(vo)) {
					System.out.println("업데이트");
					service.user_social_update(vo);
				}else {
					System.out.println("처음입력");
					service.user_social_insert(vo);
				}		
				vo.setAdmin("N");
				session.setAttribute("loginInfo", vo);	
			}
//			{
//				  "resultcode": "00",
//				  "message": "success",
//				  "response": {
//				    "email": "openapi@naver.com",
//				    "nickname": "OpenAPI",
//				    "profile_image": "https://ssl.pstatic.net/static/pwe/address/nodata_33x33.gif",
//				    "age": "40-49",
//				    "gender": "F",
//				    "id": "32742776",
//				    "name": "오픈 API",
//				    "birthday": "10-01"
//				  }
//				}
			
			return "redirect:/";  //로그인 시 루트(home.jsp)로 이동
		}
}
