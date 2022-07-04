package com.hanul.anafor;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import my_shop.my_ShopServiceImpl;
import user.UserVO;
import web_shop.ShopDetailVO;

@Controller
public class My_ShopController {
	
	@Autowired @Qualifier("ateam") private SqlSession sql;
	@Autowired private my_ShopServiceImpl service;

//============================== My 주문 목록 리스트 조회 ==============================	
	@RequestMapping("/shopList.my")
	public String shop(ShopDetailVO vo, HttpSession session, Model model) {
		
		String user_id = ((UserVO) session.getAttribute("loginInfo")).getUser_id();
		model.addAttribute("list", service.order_list(user_id));
		
		return "my_shop/shopList";
	}
//============================== My 주문 해당 목록 상세 조회 ===========================
	@RequestMapping("/shopDetail.my")
	public String adminShopDetail(int id, Model model) {
		
		service.order_detail(id);
		model.addAttribute("vo", service.order_detail(id));
		
		return "my_shop/shopDetail";
	}
//======================================================================================
	@RequestMapping("/cancel.my")
	public String cancel(int id, RedirectAttributes rttr) {
		
		service.order_cancel(id);
		rttr.addFlashAttribute("cancel", "OK");
		
		return "redirect:shopList.my";
	}
	//============================== My 주문 수정 페이지 호출 ===========================
		@RequestMapping("shopModify.my")
		public String myShopModify(int id, Model model) {
			
			service.order_detail(id);
			model.addAttribute("vo", service.order_detail(id));
			
			return "my_shop/shopModify";
		}
//============================== My 주문 수정 처리 요청 ===========================
		@RequestMapping("order_update.my")
		public String myShopUpdate(ShopDetailVO vo, RedirectAttributes rttr) {
			
			String tel = vo.getTel();
			tel = tel.replaceAll(",", "-");
			tel = tel.replaceAll("-", "");
			tel = tel.substring(0, 3) + "-" + tel.substring(3, 7) + "-" + tel.substring(7);
			System.out.println(tel);
			vo.setTel(tel);
			
			service.order_update(vo);		
			
			rttr.addFlashAttribute ("result", "update");
			
			return "redirect:shopList.my";
		}
//======================================================================================
	
}
