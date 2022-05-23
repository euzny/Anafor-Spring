package hp;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class hp_infoDAO {
	@Autowired @Qualifier("ateam") SqlSession sql;
	
	public Hp_infoVO detailmap(HashMap<String, String> hashmap){
		return sql.selectOne("hp.mapper.detailmap",hashmap);
	}
}
