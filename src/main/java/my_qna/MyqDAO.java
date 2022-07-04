package my_qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository
public class MyqDAO implements MyqService {

	@Autowired @Qualifier("ateam") private SqlSession sql;
	
	@Override
	public void myq_insert(MyqVO vo) {
		sql.insert("my_qna.mapper.myq_insert",vo);
	}

	@Override
	public List<MyqVO> myq_list() {
		return sql.selectList("my_qna.mapper.myq_list");
	}

	@Override
	public MyqPage myq_list(MyqPage page) {

		int pagecnt = sql.selectOne("my_qna.mapper.myq_totalList", page);
		page.setTotalList(pagecnt);
		
		List<MyqVO> list = sql.selectList("my_qna.mapper.myq_list", page);
		page.setList(list);
		return page;
	}

	@Override
	public MyqVO myq_detail(int id) {
		return sql.selectOne("my_qna.mapper.myq_detail", id);
	}

	@Override
	public void myq_update(MyqVO vo) {
		sql.update("my_qna.mapper.myq_update", vo);
	}

	@Override
	public void myq_delete(int id) {
		sql.delete("my_qna.mapper.myq_delete", id);
	}

	@Override
	public void myq_read(int id) {
		sql.update("my_qna.mapper.myq_read", id);
	}

}
