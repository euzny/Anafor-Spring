package com.hanul.anafor;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import hp.hpVO;



@Controller
public class SearchController {
   

   Gson gson = new Gson();
   
   @Autowired @Qualifier("ateam") private SqlSession sql2;

   
   @ResponseBody
   @RequestMapping(value="basic", produces = "application/json;charset=UTF-8")
   public String search(HttpServletRequest req) {
	   hpVO searchVO = new hpVO();
	   searchVO.setHp_name( req.getParameter("query") );
	   searchVO.setHp_x( req.getParameter("setHp_x") );
	   searchVO.setHp_y( req.getParameter("setHp_y") );
	   //안드에서 검색어 , 지금 위도 , 경도를 hpVO에 담아서 => String(Json)으로 보내줌 
	   //Spring에서는 json=>hpVO로 바꿔서 검색조건으로 사용
	   
	   //String keyword = req.getParameter("query");
	   //System.out.println(req.getParameter("query"));
	   List<hpVO> list = sql2.selectList("search.mapper.search",searchVO);
	   System.out.println(gson.toJson(list));
	   return gson.toJson(list); 
   }
   
   @ResponseBody
   @RequestMapping(value="/review", produces = "application/json;charset=UTF-8")
   public String review(HttpServletRequest req) {
	   
	   hpVO searchVO = new hpVO();
	   searchVO.setHp_name( req.getParameter("select") );
	   
	   List<hpVO> list = sql2.selectList("search.mapper.review", searchVO);
	   System.out.println(gson.toJson(list));
	   
	   return gson.toJson(list); 
   }
  
}