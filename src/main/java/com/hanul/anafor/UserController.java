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
import user.UserDAO;
import user.UserVO;

@Controller
public class UserController {
   
   @Autowired UserDAO dao;
   Gson gson = new Gson();
   @Autowired @Qualifier("ateam") SqlSession sql;
   @Autowired @Qualifier("ateam") private SqlSession sql2;

   @ResponseBody
   @RequestMapping(value ="/login", produces = "application/json;charset=UTF-8")
   public String login(HttpServletRequest req) {

	  UserVO vo = new UserVO();
	  vo.setUser_id(req.getParameter("user_id"));
	  vo.setUser_pw(req.getParameter("user_pw"));
      vo = dao.login(vo);
      System.out.println(gson.toJson(vo));
      return gson.toJson(vo);    
   }
   
   
   @ResponseBody
   @RequestMapping(value="/join" , produces = "application/json;charset=UTF-8")
   public String join(HttpServletRequest req) {
      UserVO vo = new UserVO();
      vo.setUser_id(req.getParameter("user_id"));
      vo.setUser_pw(req.getParameter("user_pw"));
      vo.setUser_name(req.getParameter("user_name"));
      vo.setUser_tel(req.getParameter("user_tel"));
      vo.setUser_birth(req.getParameter("user_birth"));
      vo.setUser_gender(req.getParameter("user_gender"));
      dao.join(vo);
      System.out.println("가입완료:" + vo.getUser_id());
      return "";
   }   
   
   @ResponseBody
   @RequestMapping(value ="/update", produces = "application/json;charset=UTF-8")
   public String update(HttpServletRequest req ) {
		System.out.println(req.getParameter("vo"));
		UserVO vo = gson.fromJson(req.getParameter("vo"), UserVO.class);
		System.out.println(sql.update("user.mapper.update" , vo));
      return "";
   } 
  
   @ResponseBody
   @RequestMapping(value ="/delete", produces = "application/json;charset=UTF-8")
   public String delete(HttpServletRequest req ) {
		System.out.println(req.getParameter("vo"));
		UserVO vo = gson.fromJson(req.getParameter("vo"), UserVO.class);
		System.out.println(sql.delete("user.mapper.delete" , vo));
		return "";
   } 

   
   @ResponseBody
   @RequestMapping(value="/hash", produces = "application/json;charset=UTF-8")
   public String search(HttpServletRequest req) {
	   String keyword = req.getParameter("query");
	  List<hpVO> list = sql2.selectList("user.mapper.search",keyword);
	   System.out.println(req.getParameter("query"));
	   return gson.toJson(list); 
   }
  
   
   
}