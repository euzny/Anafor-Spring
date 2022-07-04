package ad_shop;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import web_shop.ShopDetailVO;
import web_shop.WReviewPage;
import web_shop.WReviewVO;


@Repository
public class ad_ShopDAO implements ad_ShopService {

	
	@Autowired @Qualifier ("ateam") private SqlSession sql;

	@Override
	public List<WReviewVO> review_list() {
		return sql.selectList("ad_shop.mapper.list");
	}

	@Override
	public WReviewPage review_list(WReviewPage page) {
		int pagecnt = sql.selectOne("ad_shop.mapper.totalList", page);
		page.setTotalList(pagecnt);
		
		List<web_shop.WReviewVO> list = sql.selectList("ad_shop.mapper.list" , page);
		page.setList(list);
		return page;
	}

	
	@Override
	public WReviewVO review_detail(int id) {
		return sql.selectOne("ad_shop.mapper.detail", id);
	}
	
	
	
	
//==================== 관리자 주문 목록 페이지 해당 id 상세 조회 ====================
	@Override
	public ShopDetailVO order_detail(int id) {
		// TODO Auto-generated method stub
		return sql.selectOne("ad_order.mapper.detail", id);
	}
//================ 관리자 주문 목록 리스트 조회와 더불어 페이징처리 =================
	@Override
	public ad_ShopDetailPage order_list(ad_ShopDetailPage page1) {
		// TODO Auto-generated method stub
		int pagecnt = sql.selectOne("ad_order.mapper.totalList", page1);
		page1.setTotalList(pagecnt);
		
		List<ShopDetailVO> list = sql.selectList("ad_order.mapper.list", page1);
		page1.setList(list);		
		return page1;
	}

	
//	@Override
//	public List<ShopDetailVO> order_list() {
//		// TODO Auto-generated method stub
//		return sql.selectList("ad_order.mapper.list");
//	}
	
//=============== 관리자 리스트 페이지 진행 현황 옵션 업데이트 ===============
	@Override
	public boolean update(HashMap<String, Object> map) {
		return sql.update("ad_order.mapper.update", map) == 0 ? false : true;
	}
//============================================================================	

}










