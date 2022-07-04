package web_user;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import user.UserVO;

@Repository
public class WuserDAO implements WuserService {

	
	@Autowired @Qualifier("ateam") SqlSession sql;
	
	
	@Override
	public void user_join(UserVO vo) {
		
		sql.insert("wuser.mapper.join",vo);
	}

	//로그인 
	@Override
	public UserVO user_login(UserVO vo) {
		return sql.selectOne("wuser.mapper.login",vo);
	}

	@Override
	public void user_update(UserVO vo) {
		
		sql.update("wuser.mapper.update",vo);
	}

	@Override
	public void user_delete(String id) {
		sql.delete("wuser.mapper.delete",id);
	}


	@Override
	public boolean user_social_email(UserVO vo) {
		
		return (Integer) sql.selectOne("wuser.mapper.social_email",vo) == 0 ? false: true;
	}

	
	//이메일 중복체크
	@Override
	public boolean user_email_chk(String id) {
		return (Integer) sql.selectOne("wuser.mapper.emailchk",id) == 0 ? true : false;
	}

	@Override
	public boolean user_social_insert(UserVO vo) {
		
		return sql.insert("wuser.mapper.social_insert",vo) == 0 ? false: true;
	}

	@Override
	public boolean user_social_update(UserVO vo) {
		
		return sql.insert("wuser.mapper.social_update",vo) == 0 ? false: true;
	}

	@Override
	public	UserPage admin_manage_user(UserPage page) {	
		int pagecnt = sql.selectOne("wuser.mapper.usertotalList",page);
		page.setTotalList(pagecnt);
		List<UserVO> list = sql.selectList("wuser.mapper.admin_select",page);
		page.setList(list);
		return page;
	}

	// 회원 메모 삭제
	@Override
	public boolean delete_user_memo(String id) {
		
		return sql.update("wuser.mapper.delete_memo",id) == 0 ?  false:true;
	}

	// 회원 메모 저장
	@Override
	public boolean save_user_memo(String id, String memo) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("memo", memo);
		return  sql.update("wuser.mapper.save_memo",map)  == 0 ? false : true;
	}
}
