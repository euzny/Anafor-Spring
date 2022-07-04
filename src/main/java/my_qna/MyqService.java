package my_qna;

import java.util.List;

public interface MyqService {

	void myq_insert(MyqVO vo);				// 게시글 신규 저장(C)
	
	List<MyqVO>myq_list();					// 목록 조회(R)
	
	MyqPage myq_list(MyqPage page);			// 목록 조회 - 페이지 처리된 (R)
	
	MyqVO myq_detail(int id);				// 상세조회(R)
	
	void myq_update(MyqVO vo);				// 변경저장(U)
	
	void myq_delete(int id);				// 삭제(D)
	
	void myq_read(int id);					// 조회시 조회수 증가 처리(U) 

}
