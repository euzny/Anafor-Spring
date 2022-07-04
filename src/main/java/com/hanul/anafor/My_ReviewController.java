package com.hanul.anafor;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import my_review.MyReviewPage;
import my_review.my_reviewServiceImpl;
import user.UserVO;
import web_shop.WReviewVO;

@Controller
public class My_ReviewController {

	@Autowired my_reviewServiceImpl service;
	
	@Autowired private MyReviewPage page;
	
	
	@RequestMapping("/list.rev")
	public String list(HttpSession session, Model model,@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "15") int pageList ) {
		
		session.setAttribute("category", "rev");
		
		UserVO user = (UserVO) session.getAttribute("loginInfo");
		
		page.setCurPage(curPage);
		page.setPageList(pageList);
		page.setUser_id(user.getUser_id());
		
		
		model.addAttribute("page", service.review_list(page));
		
		return "my_review/list";
		
	}
	
	@RequestMapping("/reviewDetail.rev")
	public String detail(int id, Model model) {
		
	
//		service.review_list();
		service.review_detail(id);
		
		model.addAttribute("vo", service.review_detail(id));
		
		
		return "my_review/detail";
	}
	
	@RequestMapping("/review_modify.rev")
	public String modify(Model model, int id) {

		service.review_detail(id);
		
		model.addAttribute("vo", service.review_detail(id));
		
		
		return "my_review/update";
	}
	
	@RequestMapping("/review_update.rev")
	public String update(WReviewVO vo) {

		service.review_update(vo);
		
		return "redirect:reviewDetail.rev?id=" + vo.getRev_id();
	}
	
	@RequestMapping("/review_delete.rev")
	public String delete(Model model, int id) {

		service.review_delete(id);
		
		
		
		return "redirect:list.rev";
	}
	
//  추가 매핑 ▼▼▼
		@RequestMapping("/reviewNew.rev")
	public String reviewNew() {
		return "my_review/new";
	}
		
		
		
			@RequestMapping("/review_insert.rev")
	public String reviewInsert(WReviewVO vo, HttpSession session) {
		//vo.setUser_id( ((UserVO) session.getAttribute("loginInfo")).getUser_id() );
		
		service.review_insert(vo);
		
		return "redirect:list.rev";
	}
	
	
	
}
