package web_user;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;
import user.UserVO;

@Component
public class UserPage extends PageVO {
	
	private List<UserVO> list;

	public List<UserVO> getList() {
		return list;
	}

	public void setList(List<UserVO> list) {
		this.list = list;
	}


}
