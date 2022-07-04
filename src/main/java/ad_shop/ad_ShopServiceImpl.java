package ad_shop;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_shop.ShopDetailVO;
import web_shop.WReviewPage;
import web_shop.WReviewVO;

@Service
public class ad_ShopServiceImpl implements ad_ShopService {

	@Autowired private ad_ShopDAO dao;
	

	@Override
	public List<WReviewVO> review_list() {
		return dao.review_list();
	}

	@Override
	public WReviewPage review_list(WReviewPage page) {
		return dao.review_list(page);
	}
	
	@Override
	public WReviewVO review_detail(int id) {
		return dao.review_detail(id);
	}
	
	
	
	
	
	
	
	
	
	
//============================== 관리자 shop ==============================
	
//================== 관리자 페이지 사용자 주문 목록 리스트 ==================
	@Override
	public ad_ShopDetailPage order_list(ad_ShopDetailPage page1) {
		// TODO Auto-generated method stub
		return dao.order_list(page1);
	}
	

//============ 관리자 페이지 사용자 주문 리스트 해당 id 상세 조회 ===========
	@Override
	public ShopDetailVO order_detail(int id) {
		// TODO Auto-generated method stub
		return dao.order_detail(id);
	}
	
//	@Override
//	public List<ShopDetailVO> order_list() {
//		// TODO Auto-generated method stub
//		return dao.order_list();
//	}
	
//========== 관리자 페이지 사용자 주문 목록 진행현황 옵션 업데이트 ==========
	@Override
	public boolean update(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.update(map);
	}
//===========================================================================	


}
