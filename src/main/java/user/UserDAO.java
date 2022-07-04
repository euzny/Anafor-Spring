package user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

	@Autowired
	@Qualifier("ateam")
	private SqlSession sql;

	public UserVO login(UserVO inputVo) {
		UserVO vo = sql.selectOne("user.mapper.login", inputVo);
		return vo;
	}

	public void join(UserVO vo) {
		sql.insert("user.mapper.join", vo);
	}
	
	public boolean id_chk(String user_id) {
		return (Integer) sql.selectOne("user.mapper.id_chk", user_id) == 0 ? true : false;
	}

	public boolean id_chk2(String user_id) {
		return (Integer) sql.selectOne("user.mapper.id_chk2", user_id) == 1 ? true : false;
	}
	
	public UserVO social(UserVO inputVo) {
		UserVO vo = sql.selectOne("user.mapper.social", inputVo);
		return vo;
	}
	
	public void socialJoin(UserVO vo) {
		sql.insert("user.mapper.socialJoin", vo);
	}
}
