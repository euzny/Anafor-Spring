package com.hanul.anafor;


import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import web_notice.NoticeServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Web_MypageController {

	@Autowired private NoticeServiceImpl service;
	
	@RequestMapping ("mypage")
	public String list(HttpSession session, Model model) {
		
		
		
		return "mypage/list";
	}

	
	
}







