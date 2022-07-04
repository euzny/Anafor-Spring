package my_review;

import java.util.List;

import my_qna.MyqPage;
import my_qna.MyqVO;
import web_shop.ShopDetailVO;
import web_shop.WReviewVO;

public interface my_reviewService {

	//리뷰 작성하기
	void review_insert (WReviewVO vo);
	
	//리뷰 수정하기
	void review_update(WReviewVO vo);
	
	//리뷰 삭제하기
	void review_delete(int id);
	
	//리뷰 조회하기
	MyReviewPage review_list(MyReviewPage page);
	
	//리뷰 디테일 조회
	WReviewVO review_detail(int id);
	
}
