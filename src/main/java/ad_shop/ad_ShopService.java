package ad_shop;

import java.util.HashMap;
import java.util.List;

import web_shop.WReviewPage;
import web_shop.ShopDetailVO;

public interface ad_ShopService {
	
	

	
	//리뷰 리스트=====================================================================================
	
	//리뷰 리스트 전체보기
	List<web_shop.WReviewVO>review_list();
	
	
	
	
	//리뷰 리스트 페이징 처리
	WReviewPage review_list(WReviewPage page);
	
	
	//리뷰 디테일 화면
	web_shop.WReviewVO review_detail(int id);
	
	
//======================= 관리자 shop =======================
	
	//List<web_shop.ShopDetailVO> order_list();
	
	// 관리자 페이지 사용자 주문 목록 리스트
	ad_ShopDetailPage order_list(ad_ShopDetailPage page);

	
	// 관리자 페이지 사용자 주문 리스트 해당 id 상세 조회
	ShopDetailVO order_detail(int id);
	
	// 관리자 페이지 사용자 주문 목록 진행현황 옵션 업데이트
	boolean update(HashMap<String, Object> map);

}
