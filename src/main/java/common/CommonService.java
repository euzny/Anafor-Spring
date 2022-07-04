package common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.function.ServerRequest.Headers;

import user.EmailNumberVO;

@Service
public class CommonService {

	   @Autowired private JavaMailSender mailSender;
	   @Autowired @Qualifier("ateam") SqlSession sql;
	
	public JSONArray json_requestAPI(StringBuffer url) {
		JSONObject json = new JSONObject(requestAPI(url));
		JSONArray jlist = new JSONArray();
//      json = json.getJSONObject("response");

		// 조회 한도 초과 여부 확인 resultCode 가 99 이면 한도초과, 0이면 정상
		int code = json.getJSONObject("header").getInt("resultCode");
		if (code == 0) { // 정상

			json = json.getJSONObject("body");

			// 전체 의약품 수 가져오기
			int count = 0;
			if (json.has("totalCount"))
				count = json.getInt("totalCount");
//         if (json.get("items") instanceof JSONObject) {

			jlist = (JSONArray) json.get("items");
			json.put("count", count);
		} else { // 한도초과시
			json.put("resultCode", code);
		}
//      return json.toMap();   // 맵 형태로 값을 전달
		return jlist; // 맵 형태로 값을 전달
	}

	public String requestAPI(StringBuffer url) {

		String result = "";
		try {
			// URL url = new URL(apiURL);
			// 연결 할 객체가 HTTP 통신을 통하여 할 예정이므로 HTTP 간의 연결 개체 1개를 만듬
			HttpURLConnection con = (HttpURLConnection) new URL(url.toString()).openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			// 여러가지 정보를 읽어 들이는데 있어서 버퍼를 통하여 읽어 들이기 위해 BufferReader 를 사용하겠다.
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
			}
			String inputLine;
			StringBuffer res = new StringBuffer(); // 실제 값이 담겨진 변수 res 값을 리턴하여 보내 줄 예정
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			con.disconnect();
			result = res.toString();
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	//아이디 이메일 인증 메일 전송 메소드
	public int sendCheckEmail(String email) {
		
		// 인증번호 난수 생성 ,범위 (111,111 ~ 999,999)
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		System.out.println("이메일 : " + email);
		System.out.println("인증번호 : " + checkNum);

		String setForm = "sbb2388@gmail.com";
		String toMail = email;
		String title = "아나포 회원가입 인증 이메일 입니다";
		String content = "<br>인증 번호는 " + checkNum + " 입니다<br>";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setSubject(title);
			helper.setText(content, true);
			helper.setFrom(setForm);
			helper.setTo(toMail);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return checkNum; 
	}
	
	//비밀번호 찾기 메일 전송 메소드
	public void sendFindPw(String email) {
		// 임시비밀번호 난수 생성 ,범위 (111,111 ~ 999,999)
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111;

				String tempPass = Integer.toString(checkNum);

				HashMap<String, String> map = new HashMap<String, String>();
				map.put("user_id", email);
				map.put("user_pw", tempPass);

				System.out.println("이메일 : " + email);
				System.out.println("임시비밀번호 : " + checkNum);

				String setForm = "sbb2388@gmail.com";
				String toMail = email;
				String title = "아나포 임시비밀번호 발급 이메일 입니다";
				String content = "<br> 임시비밀번호는 " + checkNum + " 입니다<br>";

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
					helper.setSubject(title);
					helper.setText(content, true);
					helper.setFrom(setForm);
					helper.setTo(toMail);
					mailSender.send(message);
				} catch (Exception e) {
					e.printStackTrace();
				}
				sql.update("user.mapper.pw_find", map);
	}

		// 접근 토근을 이용하여 프로필 API 호출하기 위해 (access_token과 token_type 값을 파라미터로 전달)
		public String requestAPI(StringBuffer url, String property) {
				String result = "";
				try {
					// URL url = new URL(apiURL);

					// 연결할 객체가 HTTP통신을 할 예정이므로 HTTP간의 연결 개체 1개를 만듬.
					HttpURLConnection con = (HttpURLConnection) new URL(url.toString()).openConnection();
					con.setRequestMethod("GET");
					con.setRequestProperty("Authorization", property);			
					int responseCode = con.getResponseCode();
					// 여러 가지 정보를 읽어 들이는데 버퍼를 통해 읽어 들이기 위해 BufferReader 를 사용
					BufferedReader br;
					System.out.print("responseCode=" + responseCode);
					if (responseCode == 200) { // 정상 호출
						br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
					} else { // 에러 발생
						br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
					}
					String inputLine;
					StringBuffer res = new StringBuffer();			// 실제 값이 담겨진 변수 res 값을 리턴하여 보내줌.
					while ((inputLine = br.readLine()) != null) {
						res.append(inputLine);
					}
					br.close();
					con.disconnect();
					result = res.toString();
				} catch (Exception e) {
					System.out.println(e);
				}
				
				return result;
			}
			
			// 파일 다운로드 처리
			public void fileDownload(String filename, String filepath, 
				HttpSession session, HttpServletResponse response) {
				// 실제 파일의 위치와 파일을 찾아 
				File file = new File( session.getServletContext().getRealPath("resources") 
						+ "/" + filepath );
				// filepath에 resources/    << 슬래쉬부터의 경로가 저장되어 있음.
				// 파일의 형태를 확인 (확장자를 통해.. txt? jpg? html? 등등)
				// mimeType 을 알아야 각각의 파일 형태에 따라 다운로드 받는 방식을 결정할 수 있음
				String mime = session.getServletContext().getMimeType(filename);
				
				response.setContentType(mime);
				// ex) response.setContextType("text/html; charset=utf-8");
				try {
					filename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");
				
				// 클라이언트에 파일을 첨부하여 쓰기 작업을 하는데 파일을 첨부하는 건 
				// header 에 첨부 파일 정보를 넘겨줘야 함.
					response.setHeader("content-disposition","attachment; filename=" + filename);
				
					ServletOutputStream out = response.getOutputStream();
					
					FileCopyUtils.copy(new FileInputStream(file), out);
					out.flush();		// 스트림을 통해 수행한 IO 작업 버퍼를 비우는 것
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}		
			}
			
			
			// 파일 업로드 처리
			public String fileUpload(String category, MultipartFile file, HttpSession session) {
				//D:\Study_Spring\Workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\clcd\resources		
				String resources = session.getServletContext().getRealPath("resources");
				// resources/upload/notice/2022/04/13		
				String folder = resources + "/upload/" + category + "/" 
								+ new SimpleDateFormat("yyyy/MM/dd").format(new Date());
				String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
				
				File dir = new File( folder );
	
				/* File 클래스 : 입출력에 필요한 파일 및 디렉토리에 관한 정보를 다룰 수 있음. 
				File 클래스는 파일과 디렉토리의 접근 권한, 생성된 시간, 마지막 수정 일자, 크기, 경로 등의
				정보를 얻을 수 있는 메소드를 가지고 있으며, 새로운 파일과 디렉토리 생성 및 삭제,
				이름 변경 등의 조작 메소드를 가지고 있음. */
				
				if ( ! dir.exists() )	dir.mkdirs();
				// exists() : 지정한 경로에 디렉토리/파일 구분없이 존재하는지 확인
					try {
						file.transferTo(new File( folder, uuid  ));
					// transferTo() : 기존 FileInputStream 등을 사용하지 않아도 쉽게 파일을 저장할 수 있는 메소드임 
					} catch (Exception e) {
						e.printStackTrace();
					} 
				// 	upload/notice/2022/04/13/akskgkskslksg_abc.txt
				return folder.substring(resources.length() + 1) + "/" + uuid;
			}
}