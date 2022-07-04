package web_user;

import java.util.HashMap;
import java.util.List;

import user.UserVO;

public interface WuserService {

	//회원 가입시 회원정보 저장
	void user_join(UserVO vo);
	
	//로그인시 회원정보 조회
	UserVO user_login(UserVO vo);
	
	//회원 정보 업데이트
	void user_update(UserVO vo);
	
	//회원 정보 삭제
	void user_delete(String id);
	
	//소셜 회원 정보 존재여부
	boolean user_social_email(UserVO vo);
	
	//회원 이메일 중복 여부 확인
	boolean user_email_chk(String id);
	
	//소셜 회원 정보 입력
	boolean user_social_insert(UserVO vo);
	
	//소셜 회원 정보 업데이트
	boolean user_social_update(UserVO vo);
	
	//관리자 회원 관리
	UserPage admin_manage_user(UserPage page);
	
	//회원 메모 삭제
	boolean delete_user_memo(String id);
	
	//회원 메모 저장
	boolean save_user_memo(String id, String memo);
}
