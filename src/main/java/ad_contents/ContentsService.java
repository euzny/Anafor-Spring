package ad_contents;

import java.util.HashMap;
import java.util.List;

public interface ContentsService {				// CRUD (Create, Read, Update, Delete)

	void con_insert(ContentsVO vo);				// 게시글 신규 저장(C)
	
	void con_reply_insert(ContentsVO vo);		// 답글	신규 저장(C)
	
	List<ContentsVO>con_list();					// 목록 조회(R)
	
	ContentsPage con_list(ContentsPage page);	// 목록 조회 - 페이지 처리된 (R)
	
	ContentsVO con_detail(int id);				// 상세조회(R)
	
	void con_update(ContentsVO vo);				// 변경저장(U)
	
	void con_delete(HashMap<String, Integer> map);	// 삭제(D)
	
	void con_read(int id);						// 조회시 조회수 증가 처리(U) 

	List<CodeVO> code();						// 게시판 코드명 조회
	
	List<ContentsVO>con_list(String code);		// 해당 코드 게시글 목록 조회(R)
	
	ContentsPage con_list2(ContentsPage page);	// 목록 조회 - 페이지 처리된 (R)
	
	ContentsPage con_list3(ContentsPage page);	// 목록 조회 - 페이지 처리된 (R)
}
