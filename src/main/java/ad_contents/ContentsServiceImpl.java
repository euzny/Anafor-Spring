package ad_contents;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContentsServiceImpl implements ContentsService {

	@Autowired private ContentsDAO dao;
	
	@Override
	public void con_insert(ContentsVO vo) {
		dao.con_insert(vo);
	}

	@Override
	public void con_reply_insert(ContentsVO vo) {
		dao.con_reply_insert(vo);
	}

	@Override
	public List<ContentsVO> con_list() {
		return dao.con_list();
	}

	@Override
	public ContentsPage con_list(ContentsPage page) {
		return dao.con_list(page);
	}

	@Override
	public ContentsVO con_detail(int id) {
		return dao.con_detail(id);
	}

	@Override
	public void con_update(ContentsVO vo) {
		dao.con_update(vo);
	}

	@Override
	public void con_read(int id) {
		dao.con_read(id);
	}

	@Override
	public List<CodeVO> code() {
		return dao.code();
	}

	@Override
	public List<ContentsVO> con_list(String code) {
		return dao.con_list(code);
	}

	@Override
	public ContentsPage con_list2(ContentsPage page) {
		return dao.con_list2(page);
	}

	@Override
	public void con_delete(HashMap<String, Integer> map) {
		dao.con_delete(map);
	}

	@Override
	public ContentsPage con_list3(ContentsPage page) {
		return dao.con_list3(page);
	}

}
