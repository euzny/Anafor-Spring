package web_user;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.UserVO;

@Service
public class WuserServiceImpl implements WuserService {

	@Autowired WuserDAO dao;
	
	@Override
	public void user_join(UserVO vo) {
		 dao.user_join(vo);
	}

	@Override
	public UserVO user_login(UserVO vo) {
		
		return dao.user_login(vo);
	}

	@Override
	public void user_update(UserVO vo) {
		dao.user_update(vo);
	}

	@Override
	public void user_delete(String id) {
	
		dao.user_delete(id);
	}


	@Override
	public boolean user_social_email(UserVO vo) {
		return dao.user_social_email(vo);
	}

	@Override
	public boolean user_email_chk(String id) {
		return dao.user_email_chk(id);
	}

	@Override
	public boolean user_social_insert(UserVO vo) {
		return dao.user_social_insert(vo);
	}

	@Override
	public boolean user_social_update(UserVO vo) {
		return dao.user_social_update(vo);
	}

	@Override
	public UserPage admin_manage_user(UserPage page) {

		return dao.admin_manage_user(page);
	}

	@Override
	public boolean delete_user_memo(String id) {
		return dao.delete_user_memo(id);
		
	}

	@Override
	public boolean save_user_memo(String id, String memo) {
		return dao.save_user_memo(id, memo);
	}
	
	

}
