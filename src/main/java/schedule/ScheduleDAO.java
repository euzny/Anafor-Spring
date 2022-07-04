package schedule;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO {

	@Autowired
	@Qualifier("ateam")
	private SqlSession sql;

	public void schedule(ScheduleVO vo) {

		sql.insert("schedule.mapper.insert", vo);
	}

	public ScheduleVO list(ScheduleVO vo) {

		ScheduleVO dto = sql.selectOne("schedule.mapper.select", vo);
		return dto;
	}

}
