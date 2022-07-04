package web_customer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO implements CustomerService {

	@Autowired @Qualifier("ateam") private SqlSession sql;
	
	//Q&A
	
	@Override
	public void qna_insert(CustomerVO vo) {
		sql.insert("wcustomer.mapper.qna_insert", vo);
	}

	@Override
	public void qna_reply_insert(CustomerVO vo) {
		sql.insert("wcustomer.mapper.qna_reply_insert",vo);
	}

	@Override
	public List<CustomerVO> qna_list() {
		return sql.selectList("wcustomer.mapper.list");
	}

	@Override
	public CustomerPage qna_list(CustomerPage page) {

		// 1. 먼저 총 글의 개수를 알아야 페이지 처리를 할 수 있기 때문에 전체 글 개수를 조회
		int pagecnt = sql.selectOne("wcustomer.mapper.qna_totalList", page);
		page.setTotalList(pagecnt);
		
		List<CustomerVO> list = sql.selectList("wcustomer.mapper.qna_list", page);
		page.setList(list);
		return page;
	}

	@Override
	public CustomerVO qna_detail(int id) {
		return sql.selectOne("wcustomer.mapper.qna_detail", id);
	}

	@Override
	public void qna_update(CustomerVO vo) {
		sql.update("wcustomer.mapper.qna_update", vo);
	}

	@Override
	public void qna_delete(int id) {
		sql.delete("wcustomer.mapper.qna_delete", id);
	}

	@Override
	public void qna_read(int id) {
		sql.update("wcustomer.mapper.qna_read", id);
	}

	//FAQ
	
	@Override
	public void faq_insert(CustomerVO vo) {
		sql.insert("wcustomer.mapper.faq_insert", vo);
	}

	@Override
	public List<CustomerVO> faq_list() {
		return sql.selectList("wcustomer.mapper.faq_list");

	}

	@Override
	public CustomerPage faq_list(CustomerPage page) {
		// 1. 먼저 총 글의 개수를 알아야 페이지 처리를 할 수 있기 때문에 전체 글 개수를 조회
		int pagecnt = sql.selectOne("wcustomer.mapper.faq_totalList", page);
		page.setTotalList(pagecnt);
		
		List<CustomerVO> list = sql.selectList("wcustomer.mapper.faq_list", page);
		page.setList(list);
		return page;
	}

	@Override
	public CustomerVO faq_detail(int id) {
		return sql.selectOne("wcustomer.mapper.faq_detail", id);
	}

	@Override
	public void faq_update(CustomerVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void faq_delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void faq_read(int id) {
		sql.update("wcustomer.mapper.faq_read", id);
	}

}
