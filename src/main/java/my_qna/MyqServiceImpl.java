package my_qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyqServiceImpl implements MyqService {

	@Autowired private MyqDAO dao;
	
	@Override
	public void myq_insert(MyqVO vo) {
		dao.myq_insert(vo);
	}

	@Override
	public List<MyqVO> myq_list() {
		return dao.myq_list();
	}

	@Override
	public MyqPage myq_list(MyqPage page) {
		return dao.myq_list(page);
	}

	@Override
	public MyqVO myq_detail(int id) {
		return dao.myq_detail(id);
	}

	@Override
	public void myq_update(MyqVO vo) {
		dao.myq_update(vo);
	}

	@Override
	public void myq_delete(int id) {
		dao.myq_delete(id);
	}

	@Override
	public void myq_read(int id) {
		dao.myq_read(id);
	}

}
