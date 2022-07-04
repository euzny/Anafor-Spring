package com.hanul.anafor;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.format.DataFormatDetector;
import com.google.gson.Gson;

import ad_main.GraphServiceImpl;
import web_notice.NoticeServiceImpl;




@Controller
public class Ad_MainController {
	
@Autowired @Qualifier("ateam") private SqlSession sql;

@Autowired private GraphServiceImpl service;


	@RequestMapping ("admin")
	public String list(HttpSession session, Model model) {
		Calendar calendar = new GregorianCalendar();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(calendar.getTime());  //오늘
		String aweek[] = new String[8]; //일주일 기간 (x축)
		aweek[7]=today;
		for(int i=1; i<=7; i++) {
			calendar.add(Calendar.DATE, -1); //1씩 빠짐 
			aweek[7-i]= format.format(calendar.getTime());
		}
		
		String lWeek = format.format(calendar.getTime());  //지난주(7일 전)
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("today", today);
		map.put("lWeek", lWeek);
		model.addAttribute("aweek",new Gson().toJson(aweek));  //한번만
		model.addAttribute("list",new Gson().toJson(service.search(map)));
		model.addAttribute("order",new Gson().toJson(service.search2(map)));
		model.addAttribute("sorder",service.sorder(today));
		model.addAttribute("inquiry",service.inquiry(today));
		model.addAttribute("newuser",service.newuser(today));
		
		session.setAttribute("category", "bo");
		return "admin_main/list";
	}
	
	
	@RequestMapping ("/dashboard.bo")
		public String dashboard(HttpSession session, Model model) {
		      
		session.setAttribute("category", "bo");
		   
		return "admin_main/dashboard";

	}
}







