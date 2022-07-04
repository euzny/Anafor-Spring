package web_shop;

import java.util.List;

import user.UserVO;


public interface ShopService {
	
void Review_insert(WReviewVO vo);

	List<WReviewVO>review_list();
	
	WReviewVO review_detail(int id);
	
	void review_update(WReviewVO	vo);
	
	void review_delete(int id);
	
	WReviewPage review_list(WReviewPage page);

	void basket_delete(int id);

	void basket_insert(BasketVO vo);
	
	List<BasketVO> basket_list(String user_id);
	
//=====================================================

	// 주문 목록 저장 (C)
	void order_insert(ShopDetailVO vo);
	
//======================================================
	
}
