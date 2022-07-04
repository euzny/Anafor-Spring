package ad_contents;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import web_customer.CustomerVO;

@Repository
public class ContentsDAO implements ContentsService {

	@Autowired @Qualifier("ateam") private SqlSession sql;
	
	@Override
	public void con_insert(ContentsVO vo) {
		sql.insert("ad_contents.mapper.con_insert", vo);
	}

	@Override
	public void con_reply_insert(ContentsVO vo) {
		sql.insert("ad_contents.mapper.con_reply_insert",vo);
	}

	@Override
	public List<ContentsVO> con_list() {
		return sql.selectList("ad_contents.mapper.list");
	}

	@Override
	public ContentsPage con_list(ContentsPage page) {
		int pagecnt = sql.selectOne("ad_contents.mapper.con_totalList", page);
		page.setTotalList(pagecnt);
		
		List<ContentsVO> list = sql.selectList("ad_contents.mapper.con_list", page);
		page.setList(list);
		return page;
	}

	@Override
	public ContentsVO con_detail(int id) {
		return sql.selectOne("ad_contents.mapper.con_detail", id);
	}

	@Override
	public void con_update(ContentsVO vo) {
		sql.update("ad_contents.mapper.con_update", vo);
	}

	@Override
	public void con_delete(HashMap<String, Integer> map) {
		sql.delete("ad_contents.mapper.con_delete", map);
		sql.update("ad_contents.mapper.con_update_qna",map);
	}

	@Override
	public void con_read(int id) {
		sql.update("ad_contents.mapper.con_read", id);
	}

	@Override
	public List<CodeVO> code() {
		return sql.selectList("ad_contents.mapper.code_list");
	}

	@Override
	public List<ContentsVO> con_list(String code) {
		return sql.selectList("ad_contents.mapper.con_list", code);
	}

	@Override
	public ContentsPage con_list2(ContentsPage page) {
		int pagecnt = sql.selectOne("ad_contents.mapper.con_totalList2", page);
		page.setTotalList(pagecnt);
		
		List<ContentsVO> list = sql.selectList("ad_contents.mapper.con_list2", page);
		page.setList(list);
		return page;
	}

	@Override
	public ContentsPage con_list3(ContentsPage page) {
		int pagecnt = sql.selectOne("ad_contents.mapper.con_totalList3", page);
		page.setTotalList(pagecnt);
		
		List<ContentsVO> list = sql.selectList("ad_contents.mapper.con_list3", page);
		page.setList(list);
		return page;
	}


}
