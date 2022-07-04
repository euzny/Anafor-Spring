package com.hanul.anafor;



import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ad_shop.ad_ShopDetailPage;
import ad_shop.ad_ShopServiceImpl;
import web_shop.WReviewPage;

@Controller
public class Ad_ShopController {
	
	@Autowired private ad_ShopServiceImpl service;
	
	@Autowired private WReviewPage page;
	@Autowired private ad_ShopDetailPage page1;
	
	@Autowired @Qualifier("ateam") private SqlSession sql;

//============================== 주문 상세 ==============================	
	@RequestMapping("/shopDetail.sp")
	public String adminShopDetail(int id, Model model) {
		
		service.order_detail(id);
		model.addAttribute("vo", service.order_detail(id));
		
		return "admin_shop/shopDetail";
	}
//============================== 관리자 주문 목록 ==============================		
	@RequestMapping("/shopList.sp")
	public String shop(HttpSession session, @RequestParam (defaultValue = "1") int curPage, @RequestParam(defaultValue = "15") int pageList, Model model) {
		
		session.setAttribute("category", "sp");
		
		// curPage를 입력받지 않았지만 @RequestParam 어노테이션을 통해 기본값 1을 부여
		page1.setCurPage(curPage); // 현재 페이지에 대한 정보를 담기 위한 처리
		page1.setPageList(pageList);
		model.addAttribute("page1", service.order_list(page1));
		
		return "admin_shop/shopList";
	}

//============================== 관리자 주문현황 갱신요청 ==============================
	@ResponseBody
	@RequestMapping("/order_state_update.sp")
	public boolean order_state_update(int id, String code) {
		
		// 앞에는 key (가서 사용할 이름), 뒤에는 value (가서 사용할 값)
		// 보통 로그인 할 때 id, pw 는 String String 으로 사용하였는데
		// int, String 같이 사용하여야 하므로 타입이 서로 다르니까 Object 타입으로 하였음

		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("id", id);			
		map.put("code", code);
		
		return service.update(map);
	}

//===============================================================================================================================


	@RequestMapping("/list.sp")
	public String list(HttpSession session, Model model, @RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "15") int pageList ) {
		session.setAttribute("category", "sp");
		
		page.setCurPage(curPage);
		page.setPageList(pageList);
//		service.review_list();
		
		model.addAttribute("page", service.review_list(page));
		
		return "admin_shop/list";
	}

	
	@RequestMapping("/reviewDetail.sp")
	public String list(int id, Model model) {
		
	
//		service.review_list();
		service.review_detail(id);
		
		model.addAttribute("vo", service.review_detail(id));
		
		
		
		
		
		return "admin_shop/reviewDetail";
	}

	
	
	
	
	
	
}


