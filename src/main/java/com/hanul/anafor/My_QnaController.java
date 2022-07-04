package com.hanul.anafor;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import common.CommonService;
import my_qna.MyqPage;
import my_qna.MyqServiceImpl;
import user.UserVO;
import web_user.WuserServiceImpl;

@Controller
public class My_QnaController {

	@Autowired private MyqServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private MyqPage page;
	@Autowired private WuserServiceImpl user;
	@Autowired @Qualifier ("ateam") SqlSession sql;
	
   /* 게시판 전체 글 목록조회 */
   @RequestMapping ("/list.qu")
	public String list(HttpSession session, @RequestParam (defaultValue = "1") 
	int curPage, Model model, String search, String keyword) {
      
      session.setAttribute("category", "qu");

      UserVO user = (UserVO) session.getAttribute("loginInfo");
      
      // curPage를 입력받지 않았지만 @RequestParam 어노테이션을 통해 기본값 1을 부여
      page.setCurPage(curPage); // 현재 페이지에 대한 정보를 담기 위한 처리
      // 검색조건, 검색어 정보를 담음
      page.setSearch(search);   
      page.setKeyword(keyword);
      page.setWriter(user.getUser_id());
      
	  model.addAttribute("page",service.myq_list(page)); 	  
 
	  return "my_qna/list";
   }
   
}
