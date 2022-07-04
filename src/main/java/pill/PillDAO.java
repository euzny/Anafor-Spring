package pill;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class PillDAO {

	@Autowired
	@Qualifier("ateam")
	private SqlSession sql;

	public void insert(PillVO pillvo) {
		sql.insert("pill.mapper.insert", pillvo);
	}

}
