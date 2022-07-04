package com.hanul.anafor;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


import common.CommonService;

import user.EmailNumberVO;
import user.UserDAO;
import user.UserVO;

@Controller
public class UserController {

   @Autowired UserDAO dao;
   Gson gson = new Gson();
   @Autowired @Qualifier("ateam") SqlSession sql;
   @Autowired CommonService common;
 
   
  
   
   /*로그인*/
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

   /*회원가입*/
	@ResponseBody
	@RequestMapping(value = "/join", produces = "application/json;charset=UTF-8")
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

	/* 아이디 중복확인 */
	@ResponseBody
	@RequestMapping(value = "/id_chk", produces = "application/json;charset=UTF-8")
	public String id_check(HttpServletRequest req) {
		String user_id = req.getParameter("user_id");
		boolean i = dao.id_chk(user_id);
		System.out.println(gson.toJson(i));
		return gson.toJson(i);
	}

	/* 회원정보수정 */
	@ResponseBody
	@RequestMapping(value = "/update", produces = "application/json;charset=UTF-8")
	public String update(HttpServletRequest req) {
		System.out.println(req.getParameter("vo"));
		UserVO vo = gson.fromJson(req.getParameter("vo"), UserVO.class);
		System.out.println(sql.update("user.mapper.update", vo));
		return "";
	}

	/* 회원탈퇴 */
	@ResponseBody
	@RequestMapping(value = "/delete", produces = "application/json;charset=UTF-8")
	public String delete(HttpServletRequest req) {
		System.out.println(req.getParameter("vo"));
		UserVO vo = gson.fromJson(req.getParameter("vo"), UserVO.class);
		System.out.println(sql.delete("user.mapper.delete", vo));
		return "";
	}

	/* 이메일인증 */
	@ResponseBody
	@RequestMapping(value = "/emailCheck", produces = "application/json;charset=UTF-8")
	public String emailCheck(HttpServletRequest req) {
		String email = req.getParameter("user_id");
		EmailNumberVO vo = new EmailNumberVO(common.sendCheckEmail(email)); //아이디 이메일 인증 메일 전송 메소드
		return gson.toJson(vo);
	}

	/* PW찾기위한 아이디확인 */
	@ResponseBody
	@RequestMapping(value = "/id_chk2", produces = "application/json;charset=UTF-8")
	public String id_check2(HttpServletRequest req) {
		String user_id = req.getParameter("user_id");
		boolean i = dao.id_chk2(user_id);
		System.out.println("140 : " + gson.toJson(i));
		return gson.toJson(i);
	}

	/* 비밀번호찾기 */
	@ResponseBody
	@RequestMapping(value = "/pw_find", produces = "application/json;charset=UTF-8")
	public void pw_find(HttpServletRequest req) {
		String email = req.getParameter("user_id");
		common.sendFindPw(email);			//비밀번호 찾기 메일 전송 메소드
	}
	
	/*소셜로그인*/
	   @ResponseBody
	   @RequestMapping(value ="/social", produces = "application/json;charset=UTF-8")
	   public String social(HttpServletRequest req) {
		  UserVO vo = new UserVO();
		  vo.setUser_id(req.getParameter("user_id"));
	      vo = dao.social(vo);
	      System.out.println(gson.toJson(vo));
	      return gson.toJson(vo);    
	   }
	   
	   
	/*소셜회원가입*/
		@ResponseBody
		@RequestMapping(value = "/socialJoin", produces = "application/json;charset=UTF-8")
		public String socialJoin(HttpServletRequest req) {
			UserVO vo = new UserVO();
			vo.setUser_id(req.getParameter("user_id"));
			vo.setUser_name(req.getParameter("user_name"));
			vo.setUser_gender(req.getParameter("user_gender"));
			dao.socialJoin(vo);
			System.out.println("가입완료:" + vo.getUser_id());
			return "";
		}
		
	/*정보수정 버튼클릭시 조회*/
	   @ResponseBody
	   @RequestMapping(value ="/edit", produces = "application/json;charset=UTF-8")
	   public String edit(HttpServletRequest req) {
		  UserVO vo = new UserVO();
		  vo.setUser_id(req.getParameter("user_id"));
	      vo = dao.social(vo);
	      System.out.println(gson.toJson(vo));
	      return gson.toJson(vo);    
	   }		

}
