package IoT;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class IoTDAO {

	@Autowired
	@Qualifier("ateam")
	private SqlSession sql;

	public boolean box_id_chk(String box_id) {
		return (Integer) sql.selectOne("IoT.mapper.box_id_chk", box_id) == 0 ? true : false;
	}

}
