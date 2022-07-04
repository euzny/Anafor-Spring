package web_customer;

import java.util.List;

import web_customer.CustomerVO;

public interface CustomerService {				// CRUD (Create, Read, Update, Delete)
	
	//Q&A
	
	void qna_insert(CustomerVO vo);				// QnA 신규 저장(C)
		
	void qna_reply_insert(CustomerVO vo);		// QnA 답글	신규 저장(C)
	
	List<CustomerVO>qna_list();					// QnA 목록 조회(R)
	
	CustomerPage qna_list(CustomerPage page);	// QnA 목록 조회 - 페이지 처리된 (R)
	
	CustomerVO qna_detail(int id);				// QnA 상세조회(R)
	
	void qna_update(CustomerVO vo);				// QnA 변경저장(U)
	
	void qna_delete(int id);					// QnA 삭제(D)
	
	void qna_read(int id);						// QnA 조회시 조회수 증가 처리(U) 

	
	//FAQ
	
	void faq_insert(CustomerVO vo);				// FAQ 신규 저장(C)
			
	List<CustomerVO>faq_list();					// FAQ 목록 조회(R)

	CustomerPage faq_list(CustomerPage page);	// FAQ 목록 조회 - 페이지 처리된 (R)
	
	CustomerVO faq_detail(int id);				// FAQ 상세조회(R)
	
	void faq_update(CustomerVO vo);				// FAQ 변경저장(U)
	
	void faq_delete(int id);					// FAQ 삭제(D)
		
	void faq_read(int id);						// FAQ 조회시 조회수 증가 처리(U) 

}
