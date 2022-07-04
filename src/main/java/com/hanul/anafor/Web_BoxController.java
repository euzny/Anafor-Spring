package com.hanul.anafor;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import user.UserVO;
import web_shop.BasketVO;
import web_shop.ShopDetailVO;
import web_shop.ShopServicelmpl;
import web_shop.WReviewPage;


@Controller
public class Web_BoxController {

	@Autowired
	private ShopServicelmpl service;

	@Autowired private WReviewPage page;
	
	@Autowired @Qualifier("ateam") private SqlSession sql;
	
	@RequestMapping("/box.pr")
	public String list(HttpSession session, Model model, @RequestParam (defaultValue = "1") int curPage, @RequestParam(defaultValue = "3") int pageList) {

		session.setAttribute("category", "pr");
		//model.addAttribute("list", service.review_list());
			
		page.setCurPage(curPage);
		page.setPageList(pageList);
		model.addAttribute("page", service.review_list(page));
			
		return "shop/box";
	}
	
	@RequestMapping ("/basket.pr")
	public String basket(BasketVO vo, HttpSession session, Model model) {
		
		//service.basket_insert(vo);
		//MemberVO member = (MemberVO) session.getAttribute("loginInfo");
		//vo.setWriter(member.getId());
		
		//vo.setWriter(((MemberVO) session.getAttribute("loginInfo")).getId());
		
		UserVO vo2 = (UserVO) session.getAttribute("loginInfo");
		String user_id = vo2.getUser_id();
		
		model.addAttribute("list", service.basket_list(user_id));
		
		return "shop/basket";
	}

	@RequestMapping("/b.pr")
	public String b(BasketVO vo, HttpSession session) {
		
		session.setAttribute("orderInfo", vo);
		
		UserVO vo2 = (UserVO) session.getAttribute("loginInfo");
			
		vo.setUser_id(vo2.getUser_id());
		
		service.basket_insert(vo);
		
		return "redirect:basket.pr";
	}
	
	
	

//==================== 제품구매, 제품 상세페이지 ====================

	@RequestMapping("/shop.pr")
	public String shop(ShopDetailVO vo, HttpSession session) {
		
		//session.setAttribute("orderInfo", vo);
		
		return "shop/shop";
	}

	@RequestMapping("/a.pr")
	public String a(BasketVO vo, HttpSession session) {
		
		session.setAttribute("orderInfo", vo);
		
		return "redirect:order.pr";
	}
	
	@RequestMapping ("/order.pr")
	public String order(ShopDetailVO vo, HttpSession session) {
		
		session.getAttribute("orderInfo");
		
		BasketVO vo2 = (BasketVO) session.getAttribute("orderInfo");
		
		vo.setCnt(vo2.getBk_cnt());
		vo.setPrice(vo2.getBk_price());
		
		//service.order_insert(vo);
		
		return "shop/order";
	}
	
	@RequestMapping("/order_result.pr")
	public String order_result(ShopDetailVO vo, HttpSession session, RedirectAttributes rttr) {
		
		BasketVO vo2 = (BasketVO) session.getAttribute("orderInfo");
		UserVO vo3 = (UserVO) session.getAttribute("loginInfo");
		vo.setCnt(vo2.getBk_cnt());
		vo.setPrice(vo2.getBk_price());
		vo.setUser_id(vo3.getUser_id());
		String tel = vo.getTel();
		tel = tel.replaceAll(",", "-");
		tel = tel.substring(0, 8) + "-" + tel.substring(8);

		vo.setTel(tel);
		service.order_insert(vo);
		System.out.println(vo.getTel());
		System.out.println("order.mapper.insert");
		
		// redirect 페이지 이동 시 값을 가져가는 클래스 → RedirectAttributes
		// 아래와 같이 담은 값은 redirect 되는 페이지에서만 일회성으로 사용할 수 있음.
		// 현 페이지에선 redirect:/ 즉, home.jsp 에서만 사용할 수 있는 상태임.
		// 만약 redirect:list.cu 라면
		// 매핑이 list.cu 인 것을 찾아 로직을 수행 후 리턴되는 페이지(list.jsp)에서만
		// 값을 사용할 수 있음.
		rttr.addFlashAttribute("result", "OK");
		
		return "redirect:/";
	}
}

